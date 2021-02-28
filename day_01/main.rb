require_relative 'day_01'
require_relative 'day_01_2'

day = Day01.new("./input.txt")

puts "Access Code: #{day.code}"

day = Day01_2.new("./input.txt")

puts "Access Code 2: #{day.code}"