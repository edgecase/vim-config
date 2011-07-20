require 'rubygems'
require 'rake'

desc "symlink vim files"
task :default do
  symlink %w[ .vimrc .gvimrc .vim ]
  # install vundle
  system "git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git"
end


def symlink(files)
  files.each do |file|
    case
      when file_identical?(file) then skip_identical_file(file)
      when replace_all_files?    then link_file(file)
      when file_missing?(file)   then link_file(file)
      else                            prompt_to_link_file(file)
    end
  end
end


# FILE CHECKS
def file_exists?(file)
  File.exists?("#{ENV['HOME']}/#{file}")
end

def file_missing?(file)
  !file_exists?(file)
end

def file_identical?(file)
  File.identical? file, File.join(ENV['HOME'], "#{file}")
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
  directory = File.dirname(__FILE__)
  sh("ln -s #{File.join(directory, file)} #{ENV['HOME']}/#{file}")
end

def replace_file(file)
  sh "rm -rf #{ENV['HOME']}/#{file}"
  link_file(file)
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
