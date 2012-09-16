require 'spec_helper'

describe FrequencyAnalyser do

  subject { FrequencyAnalyser }

  it 'supports dependency inversion' do
    aggregator = mock(:aggregator)
    modifier = mock(:modifier)
    analyser = subject.new(aggregator, modifier)
    analyser.aggregator.should == aggregator
    analyser.modifier.should == modifier
  end

  end

end
