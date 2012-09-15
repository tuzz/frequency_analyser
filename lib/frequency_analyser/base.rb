class FrequencyAnalyser < Struct.new(:counter, :aggregation)

  def self.analyse(*files)
    new(Counter, Aggregation.new).analyse(*files)
  end

  def analyse(*files)
    files = *files.flatten

    files.each do |file|
      file.each_line do |line|
        aggregation << counter.count(line)
      end
    end

    aggregation
  end

end
