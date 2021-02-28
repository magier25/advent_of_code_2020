require 'minitest/autorun'

require_relative 'day_02_2'

class Day02_2Test < Minitest::Test
  def test_line_valid
    pr = PasswordRecord2.new("1-3 a: abcde")
    assert_equal pr.valid?, true
  end

  def test_line_invalid
    pr = PasswordRecord2.new("1-3 b: cdefg")
    assert_equal pr.valid?, false
    pr = PasswordRecord2.new("2-9 c: ccccccccc")
    assert_equal pr.valid?, false
  end

end