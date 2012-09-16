require 'spec_helper'

describe FrequencyAnalyser::Modifier do

  subject { FrequencyAnalyser::Modifier }

  let(:aggregation) do
    hash = FrequencyAnalyser::Aggregation.new
    hash.merge('a' => 1, 'b' => 2, 'c' => 2)
  end

  it 'has a probability mode' do
    probabilities = subject.modify(aggregation, :probability)

    probabilities['a'].should == 0.2
    probabilities['b'].should == 0.4
    probabilities['c'].should == 0.4
    probabilities['d'].should == 0
  end

  it 'has a percentage mode' do
    percentages = subject.modify(aggregation, :percentage)

    percentages['a'].should == 20
    percentages['b'].should == 40
    percentages['c'].should == 40
    percentages['d'].should == 0
  end

end
