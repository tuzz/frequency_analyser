## Frequency Analyser

Compose a hash containing the frequencies of characters in text.

## Usage

```
gem install frequency_analyser
```

```ruby
require 'frequency_analyser'

file = File.new('a_tale_of_two_cities.txt')
FrequencyAnalyser.analyse(file)
#=> {
  'a'=>47063, 'b'=>8139, 'c'=>13224, 'd'=>27484, 'e'=>72877, 'f'=>13152,
  'g'=>12121, 'h'=>38358, 'i'=>39784, 'j'=>622, 'k'=>4634, 'l'=>21533,
  'm'=>14922, 'n'=>41310, 'o'=>45115, 'p'=>9453, 'q'=>655, 'r'=>35956,
  's'=>36771, 't'=>52393, 'u'=>16216, 'v'=>5065, 'w'=>13835, 'x'=>666,
  'y'=>11849, 'z'=>213
}
```
