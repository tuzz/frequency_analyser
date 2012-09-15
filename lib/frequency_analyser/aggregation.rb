class FrequencyAnalyser::Aggregation < Hash

  def initialize
    self.default = 0
  end

  def <<(other)
    other.each do |key, value|
      self[key] += value
    end
  end

end
