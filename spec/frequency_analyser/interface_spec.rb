require 'spec_helper'

describe FrequencyAnalyser do

  subject { FrequencyAnalyser }

  it 'supports strings' do
    string = "foo BAR\nbaz"
    analysis = subject.analyse(string)

    analysis['a'].should == 2
    analysis['b'].should == 2
    analysis['f'].should == 1
  end

  it 'supports multiple files' do
    file1 = StringIO.new("foo BAR\nbaz")
    file2 = StringIO.new("qux")
    analysis = subject.analyse(file1, file2)

    analysis['a'].should == 2
    analysis['x'].should == 1
  end

  it 'supports arrays' do
    file1 = StringIO.new("foo BAR\nbaz")
    file2 = StringIO.new("qux")
    analysis = subject.analyse([[[[file1, file2]]]])

    analysis['a'].should == 2
    analysis['x'].should == 1
  end

end
