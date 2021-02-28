
class PasswordRecord
  def initialize(record)
    @record = record
  end

  def valid?
    data = parse


    count = data[:password].count(data[:letter])
    result = data[:min] <= count && count <= data[:max]
    #puts "data: #{data.inspect}, count: #{count}, result: #{result}"
    result
  end

  private

  def parse
    parts = @record.partition(":")
    password = parts[2].strip

    p2 = parts[0].split(" ")
    letter = p2[1]

    minmax = p2[0].split("-")
    min = minmax[0].to_i
    max = minmax[1].to_i

    {password: password, letter: letter, min: min, max: max}
  end
end

class Day02
  def initialize(path)
    @path = path
    @report = load_report
  end

  def valid_passwords_count
    @report.reduce(0) do |sum, line|
      p = PasswordRecord.new(line)
      sum += 1 if p.valid?
      sum
    end
  end

  private

  def load_report
    report = []
    File.open(@path) do |f|
      f.each do |line|
        report.push(line.strip)
      end
    end
    report
  end

end