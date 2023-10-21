# frozen_string_literal: true
require_relative './operator'

module Commands
  module WordCount
    # To Execute different subcommands
    class Executor
      def initialize(args: nil, stdin: nil, options: nil)
        @args = args
        @stdin = stdin
        @options = options
      end

      def execute
        sa = WordCount::SimplifyArgs.new(@args, @stdin)
        @filepath = sa.filepath

        file_content = @filepath.nil? ? sa.stdin_content : FileOperator::Processor.new(@filepath).read_file

        method_name = @options[sa.option[1]].to_s

        puts Operator.new(file_content).send(method_name)
      end
    end
  end
end
