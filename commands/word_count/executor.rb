# frozen_string_literal: true
require_relative './operator'
require_relative './parser'

module Commands
  module WordCount
    # Execute different subcommands
    class Executor
      def initialize(args: nil, stdin: nil, options: nil)
        @args = args
        @stdin = stdin
        @options = options
      end

      def execute
        parser = Parser.new(@args, @stdin)
        content = read_content(parser)
        option = @options[parser.option]
        method = extract_method(option)

        puts Operator.new(content).send(method)
        puts "\nWordCount : #{extract_description(option)} #{parser.filepath}"
      end

      private

      def read_content(parser)
        if parser.filepath.nil?
          parser.stdin_content
        else
          FileOperator::Processor.new(parser.filepath).read_file
        end
      end

      def extract_method(option)
        option.nil? ? '' : option['method']
      end

      def extract_description(option)
        option.nil? ? 'Invalid' : option['description']
      end
    end
  end
end
