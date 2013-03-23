Gem::Specification.new do |s|
  s.name        = 'frequency_analyser'
  s.version     = '1.3.1'
  s.summary     = 'Frequency Analyser'
  s.description = 'Compose a hash containing the frequencies of characters in text'
  s.author      = 'Chris Patuzzo'
  s.email       = 'chris@patuzzo.co.uk'
  s.files       = ['README.md'] + Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/tuzz/frequency_analyser'

  s.add_development_dependency 'rspec'
end
