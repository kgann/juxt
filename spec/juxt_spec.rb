require 'spec_helper'

describe Juxt do
  let(:arr1){ ['foo', 'bar'] }
  let(:arr2){ ['foo'] }
  let(:arr3){ [] }
  let(:obj1){ 'foo' }
  let(:obj2){ {:foo => 'foo', :bar => 'bar'} }
  let(:obj3){ Object.new }

  describe 'Array#map_juxt' do
    it "should call juxtapose for all array elements" do
      arr1.first.should_receive(:juxtapose).with :upcase, :reverse
      arr1.last.should_receive(:juxtapose).with :upcase, :reverse
      arr1.map_juxt :upcase, :reverse
    end
    specify{ expect(arr1.map_juxt :upcase, :reverse).to eq [['FOO', 'oof'], ['BAR', 'rab']] }
    specify{ expect(arr2.map_juxt :upcase, :reverse).to eq [['FOO', 'oof']] }
    specify{ expect(arr3.map_juxt :upcase, :reverse).to eq [] }
  end

  describe 'Object#juxt' do
    it "should execute a Proc or lambda with self as the only argument" do
      obj3.stub(:method1){ 10 }
      obj3.stub(:method2){ 20 }
      proc = Proc.new{ |m| m.method1 + m.method2 }
      lambda = ->(m){ m.method1 * m.method2 }
      expect(obj3.juxt proc, lambda).to eq [30, 200]
    end

    describe String do
      specify{ expect(obj1.juxt :upcase, :reverse).to eq ['FOO', 'oof'] }
    end

    describe Hash do
      specify{ expect(obj2.juxt :foo, :bar).to eq ['foo', 'bar'] }
    end
  end
end