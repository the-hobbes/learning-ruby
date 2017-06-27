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

range = calculate_network_range("192.168.0.108", "255.255.255.0")
active = scan_range(range)
write_to_file(active)
