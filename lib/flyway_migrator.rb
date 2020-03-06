# frozen_string_literal: true

require "flyway_migrator/identity"
require "flyway_migrator/cli"
require 'optparse'
require 'date'

module FlywayMigrator
    class Migration 
        def self.generate(name)
            begin
                if name
                    new_escaped = name.gsub(' ', '_')
                    filename = "V#{DateTime.now.strftime("%Y%m%d%H%M")}__#{new_escaped}.sql"
                    if File.file?(filename)
                        raise Exception.new("File #{filename} already exists in this directory")
                    end
                    File.new(filename, "w")
                else 
                    raise Exception.new('Description Required')
                end
            rescue Exception => e
                puts "#{e}"
            end

        end
    end
end