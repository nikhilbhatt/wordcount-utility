# frozen_string_literal: true
require_relative 'argument_validator'
require_relative 'argument_parser'

module Commands
  module WordCount
    # Parse Content
    class Parser
      attr_reader :option, :filepath, :stdin_content

      def initialize(args, stdin)
        @option, @filepath, @stdin_content = if file_present?(stdin)
                                               ArgumentValidator.new(args).validate
                                               ArgumentParser.new(args, stdin).parse_file_content
                                             else
                                               ArgumentParser.new(args, stdin).parse_stdin_content
                                             end
      end

      private

      def file_present?(stdin)
        stdin.tty?
      end
    end
  end
end
