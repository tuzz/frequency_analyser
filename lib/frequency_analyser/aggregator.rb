class FrequencyAnalyser::Aggregator < Struct.new(:counter, :aggregation)

  def initialize(counter = fa::Counter, aggregation = fa::Aggregation.new)
    super
  end

  def self.aggregate(*files)
    new.aggregate(*files)
  end

  def aggregate(*files)
    files = [files].flatten
    files.each do |file|
      file.each_line do |line|
        aggregation << counter.count(line)
      end
    end
    aggregation
  end

  private
  def fa
    FrequencyAnalyser
  end

end