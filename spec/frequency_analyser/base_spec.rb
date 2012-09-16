require 'spec_helper'

describe FrequencyAnalyser do

  subject { FrequencyAnalyser }

  it 'supports dependency inversion' do
    aggregator = mock(:aggregator)
    modifier = mock(:modifier)
    analyser = subject.new(aggregator, modifier)
    analyser.aggregator.should == aggregator
    analyser.modifier.should == modifier

    counter = subject::Counter.new(%w(1 3 5 !))
    aggregator = subject::Aggregator.new(counter)
    analyser = subject.new(aggregator)
    aggregation = analyser.analyse('!12321!')

    aggregation['!'].should == 2
    aggregation['3'].should == 1
    aggregation['5'].should == 0
  end

  it 'calculates the frequencies in text' do
    aggregation = subject.analyse("foo BAR\nbaz")

    aggregation['a'].should == 2
    aggregation['f'].should == 1
    aggregation['q'].should == 0

    probabilities = subject.analyse('aaaz', :probability)

    probabilities['a'].should == 0.75
    probabilities['z'].should == 0.25
    probabilities['q'].should == 0

    percentages = subject.analyse('AaBBc', :percentage)

    percentages['a'].should == 40
    percentages['c'].should == 20
    percentages['z'].should == 0
  end

  it 'does not persist aggregations between calls' do
    aggregation1 = subject.analyse("foo BAR\nbaz")
    aggregation2 = subject.analyse("foo BAR\nbaz")
    aggregation3 = subject.analyse("foo BAR\nbaz")

    aggregation1.should == aggregation2
    aggregation1.should == aggregation3
  end

  it 'does not persist modifications between calls' do
    percentages = subject.analyse("foo BAR\nbaz", :percentage)
    aggregation = subject.analyse("foo BAR\nbaz")
    aggregation.should_not == percentages

    probabilities = subject.analyse("foo BAR\nbaz", :probability)
    aggregation = subject.analyse("foo BAR\nbaz")
    aggregation.should_not == probabilities
  end


end
