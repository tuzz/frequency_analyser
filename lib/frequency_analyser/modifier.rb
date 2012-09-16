class FrequencyAnalyser::Modifier < Struct.new(:aggregation)

  def self.modify(aggregation, mode)
    new(aggregation).modify(mode)
  end

  def modify(mode)
    case mode
    when :probability
      probability
    when :percentage
      percentage
    else
      aggregation
    end
  end

  private
  def probability
    aggregation.inject(aggregation) do |hash, (k, v)|
      hash.merge!(k => v.to_f / sum)
    end
  end

  def percentage
    aggregation.inject(aggregation) do |hash, (k, v)|
      hash.merge!(k => v.to_f / sum * 100)
    end
  end

  def sum
    @sum ||= aggregation.values.inject(:+)
  end

end
