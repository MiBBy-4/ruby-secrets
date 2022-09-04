# The other way to implemebt hashes like an object in javascript
class SuperObject < BasicObject
  def initialize
    @proxy = {}
  end

  def method_missing(method, *args, &block)
    return store_attribute(method, *args) if method.end_with?('=')

    return self.__proxy__[method] if self.__proxy__.has_key?(method)

    super
  end

  def inspect
    __proxy__.inject("#<SuperHash: ") do |str, el|
      str += "@#{el[0]}=#{el[1]} "
    end.strip + ">"
  end

  def respond_to?(method, include_private = false)
    self.__proxy__.has_key?(method) || method.end_with?('=')
  end


  private

  def __proxy__
    @proxy
  end

  def store_attribute(method, *args)
    key = method.to_s.delete_suffix('=')
    self.__proxy__[key.to_sym] = args[0]
  end
end
s = SuperObject.new
s.name = 'John'
s.surname = 'Doe'
puts s.name
puts s.inspect
puts s.respond_to?(:surname)
