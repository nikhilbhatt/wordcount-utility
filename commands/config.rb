# frozen_string_literal: true

require 'yaml'

module Commands
  # Load and process commands
  class Config
    attr_reader :data

    def initialize(file)
      @data = YAML.load_file(file)
    end
  end
end
