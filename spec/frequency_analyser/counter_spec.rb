require 'spec_helper'

describe FrequencyAnalyser::Counter do

  subject { FrequencyAnalyser::Counter }

  it 'can take an optional domain array' do
    counter = subject.new(%w(1 3 5 !))

    counter.count('foo bar baz').should be_empty
    count = counter.count('!12321!')

    count['1'].should == 2
    count['2'].should == 0
    count['!'].should == 2
  end

  describe '#count' do
    let(:count) { subject.count('foo bar baz') }

    it 'returns a hash of frequencies for the input' do
      count['o'].should == 2
      count['z'].should == 1
      count['q'].should == 0
    end

    it 'does not store characters with a frequency of 0' do
      count.values.should_not include(0)
    end

    it 'does not count non-alphabetical frequencies' do
      subject.count('123!@=&*,./<>?').should be_empty
    end

    it 'is pure' do
      text = 'Foo Bar 123'
      subject.count(text)
      text.should == 'Foo Bar 123'
    end

    it 'is case insensitive when counting' do
      count = subject.count('Aa B c')
      count['a'].should == 2
      count['b'].should == 1
      count['c'].should == 1
    end
  end

end
