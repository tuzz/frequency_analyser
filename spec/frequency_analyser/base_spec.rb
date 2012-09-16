require 'spec_helper'

describe FrequencyAnalyser do

  subject { FrequencyAnalyser }

  it 'supports dependency inversion' do
    aggregator = mock(:aggregator)
    analyser = subject.new(aggregator)
    analyser.aggregator.should == aggregator
  end

  describe 'modes' do
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
