# WordCount Utility

The WordCount utility is a command-line tool written in Ruby that allows you to count various metrics (bytes, lines, words, and characters) in a text file or from standard input. It provides a simple and efficient way to gather information about the content of a file. This utility is designed to be user-friendly and versatile, offering a range of options to meet your specific needs.

## Table of Contents

- [Usage](#usage)
- [Options](#options)
- [Installation](#installation)
- [How to Use](#how-to-use)
- [Contributing](#contributing)

## Usage

The primary purpose of the WordCount utility is to analyze text content and provide valuable insights about the file. By running the utility with appropriate options, you can retrieve the following information:

- `-c`: Outputs the number of bytes in the file.
- `-l`: Outputs the number of lines in the file.
- `-w`: Outputs the number of words in the file.
- `-m`: Outputs the number of characters in the file.
- `-h`: Displays the help message, which provides information on the utility and its usage.
- No options: Outputs all of the above information.

## Installation

To use the WordCount utility, follow these simple installation steps:

1. Ensure you have Ruby installed on your system. You can download it from [the official Ruby website](https://www.ruby-lang.org/en/documentation/installation/).

2. Clone or download this repository to your local machine. You can do this by running the following command:

```
git clone https://github.com/nikhilbhatt/wordcount-utility.git
```

3. Navigate to the directory where the WordCount utility is located using your terminal and run this command

```
ln -s run.rb /usr/local/bin/word-count
chmod +x /usr/local/bin/word-count
```

## How to Use

Using the WordCount utility is straightforward:

1. Open your terminal.
2. run this command

```
word-count [options] <file_name>
```

### Displaying Help Information

Run the following command to see the help message, which provides an overview of the utility and its available options:
```
word-count -h
```

## Contributing

If you find any issues, have suggestions for improvements, or would like to contribute to this project, please feel free to:

- Open issues to report problems or suggest enhancements.
- Submit pull requests to propose changes or fixes.

We welcome contributions from the community to help make this utility even more useful.
