#!/usr/bin/ruby
#author: benjamin ferrari
#renames all tags in all del.icio.us bundles to the 
#name of the bundle.


require "optparse"
require "rubilicious" # $ gem install rubilicious


def bundles_to_tags (account)
  api = Rubilicious.new account[:username], account[:password]
  rules = Hash.new{|h,k|h[k] = []}

  #tags which are in multiple bundles are renamed to multiple tags
  api.bundles.each{|k,v| rules[k] = rules[k] | v }

  rules.each do |bundle, tags|
    
    tags.each do |tag|
      api.rename_tag(tag, bundle)
      puts "renamed #{tag} to #{bundle}"
    end

  end

end

opts =  OptionParser.new 
opts.banner = "USAGE: ruby delicious_bundles2tags.rb -u USERNAME -p PASSWORD"
account = {}
opts.on("-u","--username USERNAME","the username of your delicious account") do |uname|
  account[:username] = uname
end

opts.on("-p","--password PASSWORD","the password of your delicious account") do |password|
  account[:password] = password
end

opts.on_tail("-h", "--help", "Show this message") do
  puts opts
  exit
end

opts.parse!


begin
  bundles_to_tags account
rescue => error
  puts error
  puts opts
end
