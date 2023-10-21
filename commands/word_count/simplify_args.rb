# frozen_string_literal: true

module Commands
  module WordCount
    # Process and simplify args
    class SimplifyArgs
      attr_reader :option, :filepath, :stdin_content

      def initialize(args, stdin)
        @option, @filepath, @stdin_content = parse_arguments(args, stdin)
      end

      private

      def parse_arguments(args, stdin)
        return [args[0].nil? ? '-d' : args[0], nil, stdin.read] unless file_present?(stdin)

        validate_args(args)
        option = '-d'
        if args.length == 1
          option = args[0] if args[0][0] == '-'
        elsif args.length == 2
          option = args.shift
        end

        file_name = args[0] if args[0][0] != '-'

        [option, file_name, nil]
      end

      def file_present?(stdin)
        stdin.tty?
      end

      def validate_args(args)
        return if args.length == 1 || args.length == 2

        puts 'Usage: nik-wc [options] <file_name.txt>'
        exit(1)
      end
    end
  end
end
