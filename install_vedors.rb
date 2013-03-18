#!/usr/bin/env ruby
require 'fileutils'
require 'open-uri'


git_vendors = {
  'ace-jump-mode'   => 'git://github.com/winterTTr/ace-jump-mode.git',
  'popup'           => 'git://github.com/m2ym/popup-el.git',
  'auto-complete'   => 'git://github.com/m2ym/auto-complete.git',
  'expand-region'   => 'git://github.com/magnars/expand-region.el.git',
  'mark-multiple'   => 'git://github.com/magnars/mark-multiple.el.git',
  'pi-php-mode'     => 'git://github.com/exu/pi-php-mode.git',
  'twiterring-mode' => 'git://github.com/hayamiz/twittering-mode.git',
  'yasnippet'       => 'git://github.com/capitaomorte/yasnippet.git',
  'workgroups'      => 'git://github.com/tlh/workgroups.el.git',
  'zencoding'       => 'git://github.com/rooney/zencoding.git',
  'rvm'             => 'git://github.com/senny/rvm.el.git',

  'logito'          => 'git://github.com/sigma/logito.git',
  'pcache'          => 'git://github.com/sigma/pcache.git',
  'gh'              => 'git://github.com/sigma/gh.el.git',
  'gist'            => 'git://github.com/exu/gist.el.git',
  #gist and dependencies my branch forked with next as default

  'rinari'          => 'git://github.com/eschulte/rinari.git',
  'magit'           => 'git://github.com/magit/magit.git'
}

raw_files = {
  #sucks!! 'gpicker' => 'https://raw.github.com/alk/gpicker/fce3f5501131ab0a5fc96eb49feffd698ea9f40c/gpicker.el'
}

vendor_dir = File.join(File.dirname(__FILE__), "vendor")
FileUtils.cd(vendor_dir)

puts "Getting vendor projects repositories from github"

git_vendors.each do |dir,url|
  puts "* downloading #{dir}"
  FileUtils.rm_rf(dir)
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end


puts ""
puts "Getting single RAW files from github"

raw_files.each do |name, url|
  file_name = "#{name}.el"
  puts "* downloading #{name} to #{file_name}"


  FileUtils.rm file_name
  File.open("#{name}.el", "w") do |f|
    f << open(url).read
  end
end
