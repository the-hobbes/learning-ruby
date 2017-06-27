#!/usr/local/bin/ruby

require "ipaddr"
require "net/ping"
require "optparse"
require "progress_bar"


# Creates a range of IP addresses.
#
# The range begins at the network address and continues until the broadcast
# address. The range is created by the ipaddr::to_range instance method, which
# takes and ip address and subnet mask and uses it to compute the network range.
#
# Args:
#   - ip (string) the ip address of your local ethernet interface
#   - mask (string) the subnet mask of your local interface in cidr notation
# Returns:
#   - (array of strings) the list of ips in the network
def get_network_range(ip, mask)
  formatted_ip = "#{ip}/#{mask}"
  ip_range = []
  IPAddr.new(formatted_ip).to_range.each do |ip_object|
    ip_range.push(ip_object.to_s)
  end
  return ip_range
end

# Scans a range of IP addresses.
#
# Args:
#   - ip_range (array of strings) a list of ips to ping
# Returns:
#   - active_ips (array of strings) a list of ips that responded to ping
def scan_range(ip_range)
  active_ips = []
  puts "Scanning..."
  # Progress bar: https://rubygems.org/gems/progress_bar
  bar = ProgressBar.new(ip_range.length) 
  ip_range.each do |ip_address|
    if Net::Ping::External.new(ip_address).ping?
      active_ips.push(ip_address)
    end
    # methods that end in ! indicate they modify the object they are called on
    bar.increment!
  end
  puts "Done scanning!"
  return active_ips
end

# Use the OptionParser class to take in command-line arguments from the user.
# Two arguments are expected: an IP address on the network you wish to scan,
# and the subnet mask applied to that IP address. This information can be found
# via ifconfig on a Unix-like system or ipconfig on a Windows system.
args = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ./scanner.rb [args]"

  opts.on("-p", "--ipaddress ADDRESS", "ip address") do |p|
    args["ipaddress"] = p
  end
  opts.on("-m", "--netmask MASK", "network mask") do |m|
    args["netmask"] = m
  end

end.parse!

if args.length > 0  # To get the tests to run without expecting commandline input
	address_range = get_network_range(args["ipaddress"], args["netmask"])
	active_ips = scan_range(address_range)
	puts "The following addresses responded to ping on your network:"
	active_ips.each { |ip| puts ip }
end
