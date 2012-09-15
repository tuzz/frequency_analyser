class FrequencyAnalyser < Struct.new(:counter, :aggregation)

  def self.analyse(file)
    new(Counter, Aggregation.new).analyse(file)
  end

  def analyse(file)
    file.each_line do |line|
      aggregation << counter.count(line)
    end
    aggregation
  end

end
