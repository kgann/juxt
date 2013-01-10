require 'spec_helper'

describe Juxt do
  let(:arr1){ ['foo', 'bar'] }
  let(:arr2){ ['foo'] }
  let(:arr3){ [] }
  let(:obj1){ 'foo' }
  let(:obj2){ {:foo => 'foo', :bar => 'bar'} }

  describe 'Array#map_juxt' do
    specify{ expect(arr1.map_juxt :upcase, :reverse).to eq [['FOO', 'oof'], ['BAR', 'rab']] }
    specify{ expect(arr2.map_juxt :upcase, :reverse).to eq [['FOO', 'oof']] }
    specify{ expect(arr3.map_juxt :upcase, :reverse).to eq [] }
  end

  describe 'Object#juxt' do
    describe String do
      specify{ expect(obj1.juxt :upcase, :reverse).to eq ['FOO', 'oof'] }
    end

    describe Hash do
      specify{ expect(obj2.juxt :foo, :bar).to eq ['foo', 'bar'] }
    end
  end
end