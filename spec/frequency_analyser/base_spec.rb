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

  describe 'modes' do

    it 'returns a summation of character frequency by default' do
      file = StringIO.new("foo BAR\nbaz")
      analysis = subject.analyse(file)

      analysis['a'].should == 2
      analysis['b'].should == 2
      analysis['f'].should == 1
    end

    it 'has a probability mode' do
      file = StringIO.new("aaaabbbccd")
      analysis = subject.analyse(file, :probability)

      analysis['a'].should == 0.4
      analysis['b'].should == 0.3
      analysis['c'].should == 0.2
      analysis['d'].should == 0.1
      analysis['e'].should == 0
    end

    it 'has a percentage mode' do
      file = StringIO.new("aaaabbbccd")
      analysis = subject.analyse(file, :percentage)

      analysis['a'].should == 40
      analysis['b'].should == 30
      analysis['c'].should == 20
      analysis['d'].should == 10
      analysis['e'].should == 0
    end

  end

end
