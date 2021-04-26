#!/usr/bin/ruby
#require 'pry'

lines = `toggl ls -t -f project,task,description`.split("\\n")
.first
.split("\n")
.map(&:strip)
.map{|l| l.gsub(/\(#\d*\)/,"")}
.map{|l| l.gsub(/[ ]{2,}/," - ")}
.uniq[1..-1].join("\n")
#binding.pry
puts lines