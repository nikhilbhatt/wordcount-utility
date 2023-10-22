# frozen_string_literal: true

require_relative 'config'
require_relative 'word_count/executor'
require_relative '../file_operator/processor'

module Commands
  # Parser to determine command and subcommands
  class Command
    attr_reader :klass, :args, :stdin, :options

    def initialize(name: 'wc', args: nil, stdin: nil)
      config = command_config(name)
      @klass = constantize(config['class'])
      @options = config['options']
      @args = args
      @stdin = stdin
    end

    def process
      command = @klass.new(default_input)
      command.execute
    end

    private

    def command_config(name)
      config = Config.new('commands/commands.yml')
      config.data[name]
    end

    def constantize(input)
      Object.const_get("Commands::#{input}")
    end

    def default_input
      {
        args: @args,
        stdin: @stdin,
        options: @options
      }
    end
  end
end
