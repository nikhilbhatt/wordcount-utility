# frozen_string_literal: true

module Commands
  module WordCount
    # Validate input
    class ArgumentValidator
      def initialize(args)
        @args = args
      end

      def validate
        return if @args.length == 1 || @args.length == 2

        puts 'Usage: nik-wc [options] <file_name.txt>'
        exit(1)
      end
    end
  end
end
