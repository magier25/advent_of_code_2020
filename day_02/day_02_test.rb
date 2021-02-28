require 'minitest/autorun'

require_relative 'day_02'

class Day02Test < Minitest::Test
  # def test_simple
  #   file = Tempfile.new("simple")
  #   file.write <<~end
  #     1721
  #     979
  #     366
  #     299
  #     675
  #     1456
  #   end
  #   file.close

  #   day01 = Day01.new(file.path)

  #   assert_equal day01.code, 514579
  # ensure
  #   file.unlink
  # end

  def test_line_valid
    pr = PasswordRecord.new("1-3 a: abcde")
    assert_equal pr.valid?, true
    pr = PasswordRecord.new("2-9 c: ccccccccc")
    assert_equal pr.valid?, true
  end

  def test_line_invalid
    pr = PasswordRecord.new("1-3 b: cdefg")
    assert_equal pr.valid?, false
  end

end