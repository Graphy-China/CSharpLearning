
# A simple wrapper can 
# borrow the equality methods from the wrapped object.

class DisArray

  attr_reader :my_array

  def initialize
    @my_array = []
  end

  def ==(other)
    return false unless other.kind_of?(DisArray)
    @my_array == other.my_array
  end

  def eql?(other)
    return false unless other.kind_of?(DisArray)
    @my_array.eql?(other.my_array)
  end

  def hash
    @my_array.hash
  end

end
