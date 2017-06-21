#!/usr/local/bin/ruby

require "ipaddr"
require "net/ping"


# Convert an subnet mask to cidr notation.
# Args:
#   - mask (string) the subnet mask to be converted.
# Returns:
#   - cidr (string) the cidr representation of the mask.
def mask_to_cidr(mask)
  int_mask = IPAddr.new(mask).to_i  # the int representation of the mask IP
  base_2 = int_mask.to_s(2)  # the base 2 representation of the integer
  ones = base_2.count("1")  # the number of 1's in the base 2 representation
  return "/#{ones}"
end

# Get local IP address
# Usually the first one: Socket.ip_address_list[1].ip_address
# But this will check:
def get_local_ip
  ipv4_addresses = []
  Socket.ip_address_list.each do |address|
    if address.ipv4? and address.ip_address != "127.0.0.1"
      ipv4_addresses.push(address.ip_address)
    end
  end
  # Raise an error if we have more than one possibly primary address
  if ipv4_addresses.length != 1
    raise "Unable to uniquely identify primary network interface address."
  end
  return ipv4_addresses.pop
end

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
  formatted_ip = ip + mask
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
def scan_range(ip_range)
  puts "Begin scanning..."
  ip_range.each do |ip_address|
    if Net::Ping::External.new(ip_address).ping?
      puts "#{ip_address} is active!"
    end
  puts "Done scanning."
end

# TODO: Get network mask from primary interface
# TODO: tie functions together.

