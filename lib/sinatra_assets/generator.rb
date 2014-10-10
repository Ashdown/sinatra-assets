require 'sinatra_assets/version'
#require "fileutils"
require 'thor'

module SinatraAssets
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install assets into your project'
    method_options :path => :string, :force => :boolean
    def install
      if bourbon_files_already_exist? && !options[:force]
        puts "Assets already installed, doing nothing."
      else
        install_files
        puts "Assets installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Assets'
    method_options :path => :string
    def update
      if assets_already_exist?
        remove_sinatra_assets_directory
        install_files
        puts "Assets updated."
      else
        puts "No existing assets. Doing nothing."
      end
    end

    desc 'version', 'Show Sinatra-Assets version'
    def version
      say "Sinatra_Assets #{SinatraAssets::VERSION}"
    end

    private

    def assets_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
                          Pathname.new(File.join(options[:path], 'sinatra-assets'))
                        else
                          Pathname.new('sinatra-assets')
                        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_bourbon_directory
      FileUtils.rm_rf("bourbon")
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end