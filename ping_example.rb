#!/usr/bin/ruby

require 'net/ping'  # requires the net-ping ruby gem to be installed
# Docs: http://www.rubydoc.info/gems/net-ping/1.5.3/Net/Ping/External

p = Net::Ping::External.new("127.0.0.1")
puts p.ping?

