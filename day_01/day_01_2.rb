class Day01_2
  def initialize(path)
    @path = path
    @report = load_report
  end

  def code
    triple = find_triple(2020)
    return 0 if triple.size != 3

    return triple[0] * triple[1] * triple[2]
  end

  private

  def find_triple(sum)
    for i in (0..@report.size-1)
      for j in ((i+1)..@report.size-1)
        for k in ((j+1)..@report.size-1)
          s1 = @report.at(i)
          s2 = @report.at(j)
          s3 = @report.at(k)
          #puts "#{s1} + #{s2} = #{s1 + s2}"
          return [s1, s2, s3] if s1 + s2 + s3 == sum
        end
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


