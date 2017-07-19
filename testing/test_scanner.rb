require "test/unit"
require_relative "scanner"

class TestGetNetworkRange < Test::Unit::TestCase

  def test_get_network_range
    # This isn't actually a true unit test, since the IPAddr library is used by
    # the calculate_network_range function to perform the computation.
    fake_ip = "192.168.1.1"
    fake_mask = "255.255.255.254"  # /31 network is 2 addresses
    expected_ips = ["192.168.1.0", "192.168.1.1"]
    assert_equal(expected_ips, calculate_network_range(fake_ip, fake_mask))
  end

end

