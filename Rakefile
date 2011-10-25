require 'rubygems'
require 'rake'

task :default do
  symlinkage %w[ .vimrc .gvimrc .vim ]
  git_clone  'http://github.com/gmarik/vundle.git'
end

def symlinkage(files)
  files.each do |file|
    validate_source_file(file)
    case
      when file_identical?(file) then skip_identical_file(file)
      when replace_all_files?    then link_file(file)
      when file_missing?(file)   then link_file(file)
      else                            prompt_to_link_file(file)
    end
  end
end

def git_clone(repo)
  require 'pry';binding.pry
  puts " => git cloning #{repo}"
  path = File.join(ENV['HOME'], '.vim', 'vundle.git')
  remove_file(path) if file_exists?(path)
  sh "git clone #{repo} #{esc(path)}"
end


# FILE CHECKS
def validate_source_file(file)
  raise " => The source file '#{file}' does not exist.\n => Try this: git checkout #{file}" unless File.exists?(file)
end

def file_exists?(file)
  path = File.join(ENV['HOME'], file)
  File.exists?(path)
end

def file_missing?(file)
  !file_exists?(file)
end

def file_identical?(file)
  path = File.join(ENV['HOME'], file)
  File.identical?(file, path)
end

def replace_all_files?
  @replace_all == true
end


# FILE ACTIONS
def prompt_to_link_file(file)
  print "overwrite? ~/#{file} [ynaq]  "
  case $stdin.gets.chomp
    when 'y' then replace_file(file)
    when 'a' then replace_all(file)
    when 'q' then exit
    else       skip_file(file)
  end
end

def link_file(file)
  puts " => symlinking #{file}"
  directory   = File.dirname(__FILE__)
  source      = File.join(directory, file)
  destination = File.join(ENV['HOME'], file)
  sh("ln -s #{esc(source)} #{esc(destination)}")
end

def replace_file(file)
  puts " => replacing #{file}"
  path = File.join(ENV['HOME'], file)
  sh "rm -rf #{esc(path)}"
  link_file(file)
end

def remove_file(file)
  puts " => removing #{file}"
  path = File.join(ENV['HOME'], file)
  sh "rm -rf #{esc(path)}"
end

def replace_all(file)
  @replace_all = true
  replace_file(file)
end

def skip_file(file)
  puts " => skipping ~/#{file}"
end

def skip_identical_file(file)
  puts " => skipping identical ~/#{file}"
end

# handle file names in windows
def esc(str)
  "\"#{str}\""
end
