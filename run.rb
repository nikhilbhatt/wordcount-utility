require_relative './commands/command'

input_command = Commands::Command.new(args: ARGV, stdin: $stdin)
input_command.process
