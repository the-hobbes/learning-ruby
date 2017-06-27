module Scanner
  # Get local IP address
  # Usually the first one: Socket.ip_address_list[1].ip_address
  # But this will check:
  def Scanner.get_local_ip
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

  # Convert an subnet mask to cidr notation.
  # Args:
  #   - mask (string) the subnet mask to be converted.
  # Returns:
  #   - cidr (string) the cidr representation of the mask.
  def Scanner.mask_to_cidr(mask)
    int_mask = IPAddr.new(mask).to_i  # the int representation of the mask IP
    base_2 = int_mask.to_s(2)  # the base 2 representation of the integer
    ones = base_2.count("1")  # the number of 1's in the base 2 representation
    return "/#{ones}"
  end

end
