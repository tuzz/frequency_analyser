class FrequencyAnalyser < Struct.new(:counter, :aggregation)

  def initialize(counter = Counter, aggregation = Aggregation.new)
    super
  end

  def self.analyse(*args)
    new.analyse(*args)
  end

  def analyse(*args)
    files, mode = coerce(args)
    aggregation = aggregate(files)

    case mode
    when :probability
      probability(aggregation)
    when :percentage
      percentage(aggregation)
    else
      aggregation
    end
  end

  private
  def coerce(args)
    files = [args].flatten
    mode = files.pop if files.last.is_a? Symbol

    [files, mode]
  end

  def aggregate(files)
    files.each do |file|
      file.each_line do |line|
        aggregation << counter.count(line)
      end
    end
    aggregation
  end

  def probability(aggregation)
    sum = sum(aggregation)
    aggregation.inject(aggregation) do |hash, (k, v)|
      hash.merge!(k => v.to_f / sum)
    end
  end

  def percentage(aggregation)
    sum = sum(aggregation)
    aggregation.inject(aggregation) do |hash, (k, v)|
      hash.merge!(k => v.to_f / sum * 100)
    end
  end

  def sum(aggregation)
    aggregation.values.inject(:+)
  end

end
