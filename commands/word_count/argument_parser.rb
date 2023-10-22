# frozen_string_literal: true

module Commands
  module WordCount
    # Parse Fille content
    class ArgumentParser
      def initialize(args, stdin)
        @args = args
        @stdin = stdin
      end

      def parse_file_content
        option = '-d'
        if @args.length == 1
          option = @args[0] if options_present?
        elsif @args.length == 2
          option = @args.shift
        end

        file_name = @args[0] unless options_present?

        [option[1], file_name, nil]
      end

      def parse_stdin_content
        option = @args[0].nil? ? '-d' : @args[0]
        [option[1], nil, @stdin.read]
      end

      private

      def options_present?
        @args[0][0] == '-'
      end
    end
  end
end
