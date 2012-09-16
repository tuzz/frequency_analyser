require 'spec_helper'

describe FrequencyAnalyser::Aggregator do

  subject { FrequencyAnalyser::Aggregator }

  it 'supports dependency inversion' do
    counter = mock(:counter)
    aggregation = mock(:aggregation)
    aggregator = subject.new(counter, aggregation)
    aggregator.counter.should == counter
    aggregator.aggregation.should == aggregation
  end

  it 'returns a summation of character frequencies' do
    file = StringIO.new("foo BAR\nbaz")
    aggregation = subject.aggregate(file)

    aggregation['a'].should == 2
    aggregation['b'].should == 2
    aggregation['f'].should == 1
  end

  it 'supports strings' do
    string = "foo BAR\nbaz"
    aggregation = subject.aggregate(string)

    aggregation['a'].should == 2
    aggregation['b'].should == 2
    aggregation['f'].should == 1
  end

  it 'supports multiple files' do
    file1 = StringIO.new("foo BAR\nbaz")
    file2 = StringIO.new("qux")
    aggregation = subject.aggregate(file1, file2)

    aggregation['a'].should == 2
    aggregation['x'].should == 1
  end

  it 'supports arrays' do
    file1 = StringIO.new("foo BAR\nbaz")
    file2 = StringIO.new("qux")
    aggregation = subject.aggregate([[[[file1, file2]]]])

    aggregation['a'].should == 2
    aggregation['x'].should == 1
  end

  it 'is pure' do
    file = StringIO.new("foo BAR\nbaz")
    aggregation1 = subject.aggregate(file)
    aggregation2 = subject.aggregate(file)
    aggregation1.should == aggregation2
    file.read.should == "foo BAR\nbaz"
  end

end
