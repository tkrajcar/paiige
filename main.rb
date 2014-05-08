#!/usr/bin/ruby
$LOAD_PATH.push File.expand_path(".")
require 'rubygems'
require 'bundler/setup'
require 'marky_markov'
require 'socket'
require 'config'
require 'paiige'

client = TCPSocket.new(CONNECTION_HOST, CONNECTION_PORT)
p = Paiige.new
puts "Connecting...\n"
client.puts CONNECTION_STRING
REMOVE_WORDS = %w{paiige with have that about your what}

while line = client.readline
  line.chomp!
  if line =~ /.* says, "(.*)"/
    p.parse($~[1])
  elsif line =~ /^TALK/
    client.puts "#{OUTPUT_PREFIX}#{p.generate}\n"
  end
  if line =~ /says, "(.*)paiige(.*)"/i
    input_string =  /"(.*)"/.match(line).captures[0]
    input_items = input_string.downcase.gsub(/[\]\[!"#$%&'()*+,.\/:;<=>?@\^_`{|}~-]/,'').split(" ")
    input_items.reject! { |x| REMOVE_WORDS.include? x }
    input_items.delete_if { |x| x.length < 4}
    puts "Items: #{input_items}"
    client.puts "#{OUTPUT_PREFIX}#{p.generate(input_items.sample)}\n"
  end
end