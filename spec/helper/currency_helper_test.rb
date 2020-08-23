require "minitest/autorun"
require_relative '../../app/helper/currency_helper'

class CurrencyHelperTest < Minitest::Test
  include CurrencyHelper

  def test_format_currency_pence
    assert_equal "99p", format_currency(99)
    assert_equal "0p", format_currency(0)
    assert_equal "5p", format_currency(5)
  end

  def test_format_currency_pounds
    assert_equal "£1.00", format_currency(100)
    assert_equal "£3.22", format_currency(322)
    assert_equal "£1.50", format_currency(150)
    assert_equal "£1.00", format_currency(100.00001)
  end
end
