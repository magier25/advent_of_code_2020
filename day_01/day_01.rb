class Day01
  def initialize(path)
    @path = path
    @report = load_report
  end

  def code
    pair = find_pair(2020)
    return 0 if pair.size != 2

    return pair[0] * pair[1]
  end

  private

  def find_pair(sum)
    for i in (0..@report.size-1)
      for j in ((i+1)..@report.size-1)
        s1 = @report.at(i)
        s2 = @report.at(j)
        #puts "#{s1} + #{s2} = #{s1 + s2}"
        return [s1, s2] if s1 + s2 == sum
      end
    end

    []
  end

  def load_report
    report = []
    File.open(@path) do |f|
      f.each do |line|
        report.push(line.strip.to_i)
      end
    end

    report.find_all { |i| i > 0 && i < 2000 }
  end
end


