
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
    m = @record.match(/(\d+)-(\d+) (.): (.+)/).captures
    # ie. ["1", "12", "a", "akdfjakwjsjks"]
    {password: m[3], letter: m[2], min: m[0].to_i, max: m[1].to_i}
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