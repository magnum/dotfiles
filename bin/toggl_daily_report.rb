#!/usr/bin/ruby
require 'pry'
require 'Date'

(puts "toggl command not found, please install it from https://github.com/AuHau/toggl-cli" ; exit) if `command -v toggl`.empty?

from=ARGV[0] ? Date.parse(ARGV[0]) : Date.today
to=from+1
#binding.pry
cmd = "toggl ls -s #{from.to_s} -p #{to.to_s} -f project,task,description"
puts cmd
puts "="*60
lines = `#{cmd}`.split("\\n")
.first
.split("\n")
.map(&:strip)
.map{|l| l.gsub(/\(#\d*\)/,"")}
.map{|l| l.gsub(/[ ]{2,}/," - ")}
.uniq[1..-1].join("\n")
#binding.pry
puts lines
