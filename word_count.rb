#!/usr/bin/env ruby

class WordCount
  def initialize(file_name: nil, option: nil, input: nil)
    @file_name = file_name
    @input = input
    @option = option
    @file_content = open_file
    validate_input
  end

  def count_words
    words = @file_content.split
    words.count
  end

  def count_bytes
    @file_content.bytesize
  end

  def count_lines
    line_count = 0
    @file_content.each_line { line_count += 1 }
    line_count
  end

  def count_chars
    char_count = 0
    @file_content.each_char do
      char_count += 1
    end
    char_count
  end

  def default
    puts "bytes: #{count_bytes} lines: #{count_lines} words: #{count_words} chars: #{count_chars}  #{@file_name}"
  end

  def help
    <<~HELP
      Nikhil Word Count Challenge in a file

      Usage:
          nik-wc [options] <file_name>

      Where Options are:
          -c          : Outputs number of bytes in a file
          -l          : Outputs number of lines in a file
          -w          : Outputs number of words in a file
          -m          : Outputs number of characters in a file
          -h          : Displays this help message
          no options  : Outputs all the above info
    HELP
  end

  private
    def open_file
      @file_name.nil? ? @input : File.read(@file_name)
    rescue Errno::ENOENT
      puts "File not found: #{@file_name}"
      exit(1)
    rescue Errno::EACCES
      puts "Permission denied: #{@file_name}"
      exit(1)
    rescue => e
      puts "An error occurred: #{e}"
      exit(1)
    end

    def validate_input
      return if @option == '-h'
      if @input.nil? && @file_name.nil?
        puts "Invalid option see usage options -h"
        exit(1)
      end
    end
end

require_relative './simplify_args'
sa = SimplifyArgs.new(ARGV, STDIN)
wc = WordCount.new(file_name: sa.filename, option: sa.option, input: sa.stdin_content)

method_name = case sa.option
              when '-c' then :count_bytes
              when '-l' then :count_lines
              when '-w' then :count_words
              when '-m' then :count_chars
              when '-d' then :default
              when '-h' then :help
              else
                puts 'Illegal option--'
                :help
              end

puts "#{wc.send(method_name)} #{sa.filename}"
