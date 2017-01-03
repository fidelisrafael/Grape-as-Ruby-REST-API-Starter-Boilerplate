files = [
  'minimal',
  'auth',
  'complete',
  'full'
]

dest_file = File.open('template.rb', 'wb')
dest_file.puts <<-CODE
### ATTENTION: 
### This file is auto generated by `generate-unique-file.rb`. Please, don't edit this file.
### If you want to edit this code, please refer to files in scripts/ folder

require 'pry'
require_relative 'scripts/helpers'

def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end
CODE


files.each do |file|
  content = File.read("scripts/#{file}.rb")

  content.gsub!("require_relative 'helpers'", "")
  dest_file.puts content
end


dest_file.puts <<-CODE

module GrappiTemplate
  def init_template_action!
    puts "Silence is golden"
  end
end

extend GrappiTemplate

init_template_action!
CODE

dest_file.close

