require_relative 'day_02'
require_relative 'day_02_2'

day02 = Day02.new("./input.txt")

puts "Valid passwords count: #{day02.valid_passwords_count}"

day02 = Day02_2.new("./input.txt")

puts "Valid passwords count: #{day02.valid_passwords_count}"