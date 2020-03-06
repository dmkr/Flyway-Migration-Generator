# frozen_string_literal: true

module FlywayMigrator
  # Gem identity information.
  module Identity
    def self.name
      "flywayMigrator"
    end

    def self.label
      "Flyway Migrator"
    end

    def self.version
      "0.1.0"
    end

    def self.version_label
      "#{label} #{version}"
    end
  end
end
