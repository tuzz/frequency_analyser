class FrequencyAnalyser::Aggregator < Struct.new(:counter, :aggregation)

  def initialize(counter = fa::Counter, aggregation = fa::Aggregation)
    super
  end

  def self.aggregate(*files)
    new.aggregate(*files)
  end

  def aggregate(*files)
    hash = aggregation.new
    files = coerce(files)
    files.each do |file|
      file.each_line do |line|
        hash << counter.count(line)
      end
      reset(file)
    end
    hash
  end

  private
  def fa
    FrequencyAnalyser
  end

  def coerce(files)
    [files].flatten
  end

  def reset(file)
    if file.respond_to? :pos
      file.pos = 0
    end
  end

end
