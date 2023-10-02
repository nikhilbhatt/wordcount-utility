class SimplifyArgs
  attr_reader :option, :filename, :stdin_content
  def initialize(args, stdin)
    @option, @filename, @stdin_content = parse_arguments(args, stdin)
  end

  private

    def parse_arguments(args, stdin)
      if $stdin.tty?
        validate_tty_args(args)
        option = '-d'
        if args.length == 1
          option = args[0] if args[0][0] == '-'
        elsif args.length == 2
          option = args.shift
        end

        file_name = args[0] if args[0][0] != '-'

        [option, file_name, nil]
      else
        option = args[0].nil? ? '-d' : args[0]
        [option, nil, stdin.read]
      end
    end

    def validate_tty_args(args)
      unless args.length == 1 || args.length == 2
        puts 'Usage: nik-wc [options] <file_name.txt>'
        exit(1)
      end
    end
end