require "juxt/version"

class Object
  def juxtapose(*args)
    [*args].map do |x|
      case self
        when Hash then self[x.to_sym] || self[x.to_s] || self[x]
        else send x
      end
    end
  end
  alias juxt juxtapose
end

class Array
  def map_juxtapose(*args)
    map{ |e| e.juxtapose *args }
  end
  alias map_juxt map_juxtapose
end
