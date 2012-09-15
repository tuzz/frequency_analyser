require 'spec_helper'

describe FrequencyAnalyser::Aggregation do

  it 'behaves like a hash' do
    subject.should be_a Hash
  end

  it 'has a default value 0' do
    subject[123].should == 0
  end

  it 'overloads the shovel operator to carry out vector addition' do
    subject << { 'a' => 1, 'b' => 2 }
    subject.should == { 'a' => 1, 'b' => 2 }

    subject << { 'b' => 1, 'c' => 2 }
    subject.should == { 'a' => 1, 'b' => 3, 'c' => 2 }

    subject << { 'a' => 4, 'b' => 1, 'c' => 1 }
    subject.should == { 'a' => 5, 'b' => 4, 'c' => 3 }
  end

end
