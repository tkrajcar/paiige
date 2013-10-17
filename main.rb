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

while line = client.readline
  line.chomp!
  if line =~ /.* says, "(.*)"/
    p.parse($~[1])
  elsif line =~ /^TALK/
    client.puts "#{OUTPUT_PREFIX}#{p.generate}\n"
  end
  if line =~ /says, "(.*)paiige(.*)"/i
    client.puts "#{OUTPUT_PREFIX}#{p.generate}\n"
  end
end