# frozen_string_literal: true

module Commands
  module WordCount
    # Word Count operations
    class Operator
      def initialize(content)
        @content = content
      end

      def respond_to_missing?(*args)
        "Method missing #{args}"
      end

      def method_missing(_)
        'Illegal Option use -h for help'
      end

      def count_words
        @content.split.count
      end

      def count_bytes
        @content.bytesize
      end

      def count_lines
        line_count = 0
        @content.each_line { line_count += 1 }
        line_count
      end

      def count_chars
        char_count = 0
        @content.each_char { char_count += 1 }
        char_count
      end

      def default
        "bytes: #{count_bytes} lines: #{count_lines} words: #{count_words} chars: #{count_chars}"
      end

      def help
        <<~HELP
          Nikhil Word Count Challenge in a file

          Usage:
              nik-wc [options] <filepath>

          Where Options are:
              -c          : Outputs number of bytes in a file
              -l          : Outputs number of lines in a file
              -w          : Outputs number of words in a file
              -m          : Outputs number of characters in a file
              -h          : Displays this help message
              no options  : Outputs all the above info
        HELP
      end
    end
  end
end
