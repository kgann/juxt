require 'spec_helper'

describe Juxt do
  let(:arr1){ ['foo', 'bar'] }
  let(:arr2){ ['foo'] }
  let(:arr3){ [] }
  let(:obj1){ 'foo' }
  let(:obj2){ {:foo => 'foo', :bar => 'bar'} }
  let(:obj3){ Object.new }

  describe 'Array#map_juxt' do
    specify{ expect(arr1.map_juxt :upcase, :reverse).to eq [['FOO', 'oof'], ['BAR', 'rab']] }
    specify{ expect(arr2.map_juxt :upcase, :reverse).to eq [['FOO', 'oof']] }
    specify{ expect(arr3.map_juxt :upcase, :reverse).to eq [] }
  end

  describe 'Object#juxt' do
    it "should execute a Proc with self as the only argument" do
      obj3.stub(:method1){ 10 }
      obj3.stub(:method2){ 20 }
      proc1 = Proc.new{ |m| m.method1 + m.method2 }
      proc2 = Proc.new{ |m| m.method1 * m.method2 }
      expect(obj3.juxt proc1, proc2).to eq [30, 200]
    end

    it "should execute a lambda with self as the only argument" do
      obj3.stub(:method1){ 10 }
      obj3.stub(:method2){ 20 }
      lambda1 = ->(m){ m.method1 + m.method2 }
      lambda2 = ->(m){ m.method1 * m.method2 }
      expect(obj3.juxt lambda1, lambda2).to eq [30, 200]
    end

    describe String do
      specify{ expect(obj1.juxt :upcase, :reverse).to eq ['FOO', 'oof'] }
    end

    describe Hash do
      specify{ expect(obj2.juxt :foo, :bar).to eq ['foo', 'bar'] }
    end
  end
end