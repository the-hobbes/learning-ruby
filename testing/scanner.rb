#!/usr/local/bin/ruby

require "ipaddr"
require "net/ping"

def calculate_network_range(ip, mask)
  address = "#{ip}/#{mask}"
  ip_range = []
  IPAddr.new(address).to_range.each do |ip_object|
    ip_range.push(ip_object.to_s)
  end
  return ip_range
end

def scan_range(ip_range)
  active_ips = []
  ip_range.each do |ip_address|
    if Net::Ping::External.new(ip_address).ping?
      active_ips.push(ip_address)
    end
  end
  return active_ips
end

def write_to_file(active_ips)
  File.open("active_ips.txt", "w") do |file|
    active_ips.each do |ip_address|
      file.puts ip_address
    end
  end
end

if $0 == __FILE__
  # __FILE__ is the magic variable that contains the name of the current file. 
  # $0 is the name of the file used to start the program. 
  # This check says “If this is the main file being used…” 
  # This allows a file to be used as a library, and not to execute code in that
  #  context, but if the file is being used as an executable, then execute that
  #  code.
  # https://www.ruby-lang.org/en/documentation/quickstart/4/
  range = calculate_network_range("192.168.0.108", "255.255.255.0")
  active = scan_range(range)
  write_to_file(active)
end

