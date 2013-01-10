require 'spec_helper'

describe Juxt do
  let(:arr1){ ['foo', 'bar'] }
  let(:arr2){ ['foo'] }
  let(:arr3){ [] }
  let(:obj){ 'foo' }

  describe 'Array#map_juxt' do
    specify{ expect(arr1.map_juxt :upcase, :reverse).to eq [['FOO', 'oof'], ['BAR', 'rab']] }
    specify{ expect(arr2.map_juxt :upcase, :reverse).to eq [['FOO', 'oof']] }
    specify{ expect(arr3.map_juxt :upcase, :reverse).to eq [] }
  end

  describe 'Object#juxt' do
    specify{ expect(obj.juxt :upcase, :reverse).to eq ['FOO', 'oof'] }
  end
end