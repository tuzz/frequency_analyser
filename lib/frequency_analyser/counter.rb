class FrequencyAnalyser::Counter < Struct.new(:domain)

  def self.count(text)
    new('a'..'z').count(text.dup)
  end

  def count(text)
    text.downcase!
    domain.inject(Hash.new(0)) do |hash, c|
      count = text.count(c)
      hash[c] = count unless count.zero?
      hash
    end
  end

end
