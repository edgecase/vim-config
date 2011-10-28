require 'rake'
require 'rake/win32'
require 'pathname'
require 'fileutils'

WINDOW_FILES =
  { '.vimrc'  => '_vimrc',
    '.gvimrc' => '_gvimrc',
    '.vim'    => 'vimfiles' }

MAC_FILES =
  { '.vimrc'  => '.vimrc',
    '.gvimrc' => '.gvimrc',
    '.vim'    => '.vim' }

desc "Install vim configuration and plugin files"
task :default do
  installer = Installer.new(platform_files)
  installer.files.each do |f|
    case
      when f.identical?    then skip_file(f)
      when replace_all?    then auto_link_files(f)
      when f.safe_to_link? then auto_link_files(f)
      else                      prompt_to_link_files(f)
    end
  end
  Rake::Task['vundle'].execute
end

desc "Install vundle for vim plugins"
task :vundle do
  target = Installer.home_join(platform_files['.vim'], 'vundle.git')
  Installer.git_clone('http://github.com/gmarik/vundle.git', target)

  puts "\nIf this is a new installation, open vim and type ':BundleInstall' to install necessary plugins."
end

def platform_files
  Installer.windows? ? WINDOW_FILES : MAC_FILES
end

def prompt_to_link_files(file)
  print "overwrite? #{file.target} [ynaq]  "
  case $stdin.gets.chomp
    when 'y' then replace(file)
    when 'a' then replace_all(file)
    when 'q' then exit
    else          skip_file(file)
  end
end

def link_files(file)
  puts " => symlinking #{file.source} to #{file.target}"
  file.link
end

def replace(file)
  puts " => replacing #{file.source} with #{file.target}"
  file.force_link
end

def replace_all(file)
  @replace_all = true
  replace(file)
end

def replace_all?
  @replace_all == true
end

def skip_file(file)
  puts " => skipping #{file.target}"
end

def auto_link_files(file)
  file.safe_to_link? ? link_files(file) : replace(file)
end





class Installer
  attr_accessor :translations, :files

  def initialize(translations)
    @translations = translations
    @files = translations.map { |k,v| Translation.new(k, v) }
  end

  def self.windows?
    Rake::Win32.windows?
  end

  def self.git_clone(repo, target)
    FileUtils.rm_rf(target) if File.exists?(target)
    `git clone ""#{repo}"" "#{target}"`
  end

  def self.home_join(*files)
    normalize(File.join(ENV['HOME'], files))
  end

  def self.normalize(path)
    Rake::Win32.normalize(path)
  end
end



class Translation
  attr_accessor :source, :target

  def initialize(source_path, target_path)
    @source = source_file_path(source_path)
    @target = home_file_path(target_path)
  end

  def link
    raise "This source file does not exist: #{source}" unless source_exists?
    `ln -s \"#{source}\" \"#{target}\"`
  end

  def force_link
    FileUtils.rm_rf(target) && link
  end

  def safe_to_link?
    identical? || !target_exists?
  end

  def source_exists?
    File.exists?(source)
  end

  def target_exists?
    File.exists?(target)
  end

  def identical?
    File.identical?(source, target)
  end

  private

  def home_file_path(file)
    path = File.join(ENV['HOME'], file)
    Pathname.new(normalize(path))
  end

  def source_file_path(file)
    path = File.dirname(__FILE__)
    Pathname.new(normalize(File.join(path, file)))
  end

  def normalize(path)
    Rake::Win32.normalize(path)
  end
end
