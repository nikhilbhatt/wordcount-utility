# frozen_string_literal: true

module FileOperator
  # File Processor
  class Processor
    def initialize(path)
      @path = path
    end

    def read_file
      File.read(@path)
    rescue Errno::ENOENT
      puts "File not found: #{@path}"
      exit(1)
    rescue Errno::EACCES
      puts "Permission denied: #{@path}"
      exit(1)
    rescue StandardError => e
      puts "An error occurred: #{e}"
      exit(1)
    end

    def file_exist(stdin)
      stdin.tty?
    end
  end
end
