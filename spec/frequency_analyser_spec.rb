require 'spec_helper'

describe FrequencyAnalyser do

  subject { FrequencyAnalyser }

  it 'supports dependency inversion' do
    counter = mock(:counter)
    aggregation = mock(:aggregation)
    analyser = subject.new(counter, aggregation)
    analyser.counter.should == counter
    analyser.aggregation.should == aggregation
  end

  it 'returns a summation of character frequencies in the file' do
    file = StringIO.new("foo BAR\nbaz")
    analysis = subject.analyse(file)

    analysis['a'].should == 2
    analysis['b'].should == 2
    analysis['f'].should == 1
  end

end
