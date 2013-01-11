require "juxt/version"

class Object
  def juxtapose(*args)
    [*args].map{ |x| send x }
  end
  alias juxt juxtapose
end

class Array
  def map_juxtapose(*args)
    map{ |e| e.juxtapose *args }
  end
  alias map_juxt map_juxtapose
  alias juxt values_at
  alias juxtapose values_at
end

class Hash
  alias juxt values_at
  alias juxtapose values_at
end