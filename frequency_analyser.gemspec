Gem::Specification.new do |s|
  s.name        = 'frequency_analyser'
  s.version     = '0.0.1'
  s.summary     = 'Frequency Analyser'
  s.description = 'Compose a hash containing the frequencies of characters in text'
  s.author      = 'Christopher Patuzzo'
  s.email       = 'chris@patuzzo.co.uk'
  s.files       = ['README.md'] + Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/cpatuzzo/frequency_analyser'

  s.add_development_dependency 'rspec'
end
