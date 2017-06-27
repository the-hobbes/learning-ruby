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
end
