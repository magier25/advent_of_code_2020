require 'minitest/autorun'

require_relative 'day_01_2'

class Day01_2Test < Minitest::Test
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

    day01 = Day01_2.new(file.path)

    assert_equal day01.code, 241861950
  ensure
    file.unlink
  end
end