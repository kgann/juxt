require "juxt/version"

class Array
  def map_juxtapose(*args)
    map{ |e| [*args].map{ |x| e.send x } }
  end
  alias map_juxt map_juxtapose
end

class Object
  def juxtapose(*args)
    [*args].map{ |x| send x }
  end
  alias juxt juxtapose
end
