Gem::Specification.new do |s|
  s.name        = 'frequency_analyser'
  s.version     = '1.2.2'
  s.summary     = 'Frequency Analyser'
  s.description = 'Compose a hash containing the frequencies of characters in text'
  s.author      = 'Christopher Patuzzo'
  s.email       = 'chris@patuzzo.co.uk'
  s.files       = ['README.md'] + Dir['lib/**/*.*']
  s.homepage    = 'https://github.com/cpatuzzo/frequency_analyser'

  s.add_development_dependency 'rspec'
end
