require 'rake'
require 'rake/win32'
require 'pathname'
require 'fileutils'

WINDOW_FILE_TRANSLATION =
  { '.vimrc'  => '_vimrc',
    '.gvimrc' => '_gvimrc',
    '.vim'    => '_vimfiles' }

MAC_FILE_TRANSLATION =
  { '.vimrc'  => '.vimrc',
    '.gvimrc' => '.gvimrc',
    '.vim'    => '.vim' }

task :default do
  files = windows? ? WINDOW_FILE_TRANSLATION : MAC_FILE_TRANSLATION
  symlinkage(files_locations(files))
  git_clone  'http://github.com/gmarik/vundle.git', File.join(files['.vim'], 'vundle.git')
end

def symlinkage(files)
  files.each do |source, target|
    case
      when file_missing?(source)            then raise_missing_file(source)
      when files_identical?(source, target) then skip_identical_file(target)
      when replace_all_files?               then replace_file(source, target)
      when file_missing?(target)            then link_file(source, target)
      else                                  prompt_to_link_file(source, target)
    end
  end
end

def git_clone(repo, target)
  delete_file(target) if file_exists?(target)
  clone_repo(repo, target)
end

def replace_all_files?
  @replace_all == true
end

def raise_missing_file(file)
  raise " => The source file '#{file}' does not exist.\n => Try this: git checkout #{file}"
end

def files_locations(files)
  translated = {}
  files.each do |k,v|
    translated[source_file_path(k)] = home_file_path(v)
  end
  translated
end

def prompt_to_link_file(source, target)
  print "overwrite? #{target} [ynaq]  "
  case $stdin.gets.chomp
    when 'y' then replace_file(source, target)
    when 'a' then replace_all(source, target)
    when 'q' then exit
    else          skip_file(source)
  end
end

def link_file(source, target)
  puts " => symlinking #{source}"
  sh("ln -s \"#{source}\" \"#{target}\"")
end

def replace_file(source, target)
  puts " => replacing #{source} with #{target}"
  delete_file(target)
  link_file(source, target)
end

def delete_file(file)
  puts " => deleting #{file}"
  FileUtils.rm_rf(file)
end

def replace_all(source, target)
  @replace_all = true
  replace_file(source, target)
end

def skip_file(file)
  puts " => skipping #{file}"
end

def skip_identical_file(file)
  puts " => skipping identical #{file}"
end

def clone_repo(repo, target)
  puts " => git cloning #{repo}"
  sh "git clone #{repo} #{target}"
end


# UTILITIES

def file_exists?(file)
  File.exists?(file)
end

def file_missing?(file)
  !file_exists?(file)
end

def files_identical?(file, comparison)
  File.identical?(file, comparison)
end

def home_file_path(file)
  path = File.join(ENV['HOME'], file)
  Pathname.new(normalize(path))
end

def source_file_path(file)
  path = File.dirname(__FILE__)
  Pathname.new(normalize(File.join(path, file)))
end

def windows?
  Rake::Win32.windows?
end

def normalize(path)
  Rake::Win32.normalize(path)
end
