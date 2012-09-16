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

You can analyse strings too:

```ruby
FrequencyAnalyser.analyse('Hello, world!')
#=> { 'd'=>1, 'e'=>1, 'h'=>1, 'l'=>3, 'o'=>2, 'r'=>1, 'w'=>1 }
```

And collections of things:

```ruby
FrequencyAnalyser.analyse('foo', File.new('bar'), StringIO.new('baz'), ['q', 'u', 'x'])
#=> { 'a'=>2, 'b'=>2, 'f'=>1, 'o'=>2, 'q'=>1, 'r'=>1, 'u'=>1, 'x'=>1, 'z'=>1 }
```

## Probabilities and Percentages

If you'd like to calculate the frequency probabilities instead, you can pass in an optional symbol:

```ruby
FrequencyAnalyser.analyse('Hello, world!', :probability)
=> { 'd'=>0.1, 'e'=>0.1, 'h'=>0.1, 'l'=>0.3, 'o'=>0.2, 'r'=>0.1, 'w'=>0.1 }
```

The same goes for percentages:

```ruby
FrequencyAnalyser.analyse('Hello, world!', :probability)
=> { 'd'=>10, 'e'=>10, 'h'=>10, 'l'=>30, 'o'=>20, 'r'=>10, 'w'=>10 }
```

## Counting other things

By default, Frequency Analyser counts alphabetic characters. You can
change this by instantiating your own support classes:

```ruby
counter    = FrequencyAnalyser::Counter.new(%w(1 3 5 !))
aggregator = FrequencyAnalyser::Aggregator.new(counter)
analyser   = FrequencyAnalyser.new(aggregator)

analyser.analyse('!12321!')
#=> { '!'=>2, '1'=>2, '3'=>1 }
```
