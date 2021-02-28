
class PasswordRecord2
  Record = Struct.new(:min, :max, :letter, :password)
  def initialize(record)
    @record = record
  end

  def valid?
    data = parse

    first = data.letter == data.password.at(data.min-1)
    second = data.letter == data.password.at(data.max-1)
    result = (first != second)
    #puts "data: #{data.inspect}, count: #{count}, result: #{result}"
    result
  end

  def parse
    @record.match(/(\d+)-(\d+) (.): (.+)/) do |m|
      # ie. ["1", "12", "a", "akdfjakwjsjks"]
      c = m.captures
      Record.new(c[0].to_i, c[1].to_i, c[2], c[3].split(""))
    end
  end
end

class Day02_2
  def initialize(path)
    @path = path
    @report = load_report
  end

  def valid_passwords_count
    @report.reduce(0) do |sum, line|
      p = PasswordRecord2.new(line)
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