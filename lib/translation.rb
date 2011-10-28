require 'rake/win32'
require 'fileutils'
require 'pathname'
require File.join(File.dirname(__FILE__), 'installer')

class Translation
  attr_accessor :source, :target

  def initialize(source_path, target_path)
    @source = source_pathname(source_path)
    @target = target_pathname(target_path)
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

  def target_pathname(file)
    path = Installer.translate_path(file)
    Pathname.new(path)
  end

  def source_pathname(file)
    #path = File.dirname(__FILE__)
    #Pathname.new(normalize(File.join(path, file)))
    #file_path = File.join(File.dirname(__FILE__), file)
    path      = Installer.translate_path(file)
    Pathname.new(path)
  end
end
