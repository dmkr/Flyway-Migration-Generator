# frozen_string_literal: true

require "thor"
require "thor/actions"
require "runcom"

module FlywayMigrator
  # The Command Line Interface (CLI) for the gem.
  class CLI < Thor
    include Thor::Actions

    package_name Identity.version_label

    def self.configuration
      Runcom::Configuration.new project_name: Identity.name
    end

    def initialize args = [], options = {}, config = {}
      super args, options, config
      @configuration = self.class.configuration
    rescue Runcom::Errors::Base => error
      abort error.message
    end

    desc "-g, [--generate]", "Manage gem configuration."
    map %w[-g --generate] => :generate
    method_option :name,
                  aliases: "-n",
                  desc: "Name the migration file.",
                  type: :string
    def generate
      path = configuration.path

      if options.name?
        FlywayMigrator::Migration.generate(options.name)
      else help(:name)
      end
    end

    desc "-v, [--version]", "Show gem version."
    map %w[-v --version] => :version
    def version
      say Identity.version_label
    end

    desc "-h, [--help=COMMAND]", "Show this message or get help for a command."
    map %w[-h --help] => :help
    def help task = nil
      say and super
    end

    private

    attr_reader :configuration
  end
end
