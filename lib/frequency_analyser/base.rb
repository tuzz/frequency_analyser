class FrequencyAnalyser < Struct.new(:aggregator, :modifier)

  def initialize(aggregator = Aggregator, modifier = Modifier)
    super
  end

  def self.analyse(*args)
    new.analyse(*args)
  end

  def analyse(*args)
    files, mode = coerce(args)
    aggregation = aggregator.aggregate(files)
    modifier.modify(aggregation, mode)
  end

  private
  def coerce(args)
    files = [args].flatten
    mode = files.pop if files.last.is_a? Symbol

    [files, mode]
  end

end
