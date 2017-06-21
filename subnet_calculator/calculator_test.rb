#!/usr/local/bin/ruby

require_relative "calculator"
# require "rubygems"
# gem "mocha"
require "test/unit"
require "mocha/test_unit"


class TestMaskToCidr < Test::Unit::TestCase

  def test_mask_to_cidr
    assert_equal("/24", mask_to_cidr("255.255.255.0"))
    assert_equal("/14", mask_to_cidr("255.252.0.0"))
  end

end

class TestGetNetworkRange < Test::Unit::TestCase

  def test_get_network_range
    fake_ip = "192.168.1.1"
    fake_mask = "/31"
    expected_ips = ["192.168.1.0", "192.168.1.1"]
    assert_equal(expected_ips, get_network_range(fake_ip, fake_mask))
  end

end
