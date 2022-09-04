# If we trieng to call undefiend method that not declared into class or parent classes, we use method_missing method
# class Animal
#   def method_missing(method, *args, &block)
#     p "No method #{method}"
#   end
# end

# animal = Animal.new
# animal.name

# Example where we try to implement hashes like a javascript object, where we can call a key like a method, that will return value
class SuperHash < Hash
  def method_missing(method, *args, &block)
    return store_attribute(method, *args) if method.end_with?('=')

    return self[method] if self.has_key?(method)

    super
  end

  def respond_to_missing?(method, include_private = false)
    self.has_key?(method) || method.end_with?('=') || super
  end

  private

  def store_attribute(method, *args)
    key = method.to_s.delete_suffix('=')
    self[key.to_sym] = args[0]
  end
end

s = SuperHash.new
s.name = "value"
puts s.name
puts s.respond_to?(:name)
