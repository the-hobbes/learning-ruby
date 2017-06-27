#!/usr/local/bin/ruby

require_relative "scanner"
require_relative "scanner_module"
require "test/unit"


class TestMaskToCidr < Test::Unit::TestCase

  def test_mask_to_cidr
    assert_equal("/24", Scanner.mask_to_cidr("255.255.255.0"))
    assert_equal("/14", Scanner.mask_to_cidr("255.252.0.0"))
  end

end

class TestGetNetworkRange < Test::Unit::TestCase

  def test_get_network_range
    fake_ip = "192.168.1.1"
    fake_mask = "255.255.255.254"  # /31 network is 2 addresses
    expected_ips = ["192.168.1.0", "192.168.1.1"]
    assert_equal(expected_ips, get_network_range(fake_ip, fake_mask))
  end

end
