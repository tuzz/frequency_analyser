class FrequencyAnalyser::Modifier

  def self.modify(aggregation, mode)
    new.modify(aggregation, mode)
  end

  def modify(aggregation, mode)
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
