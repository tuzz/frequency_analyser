class FrequencyAnalyser::Counter

  def self.count(text)
    new.count(text.dup)
  end

  def count(text)
    text.downcase!
    ('a'..'z').inject(Hash.new(0)) do |hash, c|
      count = text.count(c)
      hash[c] = count unless count.zero?
      hash
    end
  end

end
