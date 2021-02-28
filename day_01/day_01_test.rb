require 'minitest/autorun'

require_relative 'day_01'

class Day01Test < Minitest::Test
  def test_simple
    file = Tempfile.new("simple")
    file.write <<~end
      1721
      979
      366
      299
      675
      1456
    end
    file.close

    day01 = Day01.new(file.path)

    assert_equal day01.code, 514579
  ensure
    file.unlink
  end
end