# We can also use pattern matching on objects
class Person
  attr_accessor :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  # To compare object with array in pattern matching we need to define deconstruct
  # Which should return  array
  def deconstruct
    p "Deconstructing #{name} and #{surname}"
    [name, surname]
  end

  # To compare object with hash in pattern matching we need to define deconstruct_keys
  # with keys argument
  # Method should return hash
  def deconstruct_keys(keys)
    p "Deconstructing #{keys}"

    # There we dynamicly set keys and values for hash
    hash = keys.inject({}) do |result, key|
      result[key] = self.send key
      result
    end

    p hash.inspect

    hash
  end
end

person1 = Person.new 'Ivan', 'Ivanov'

# And there we compare our array with array that will return from deconstruct
case person1
in [name, surname]
  p name, surname
end

person2 = Person.new 'John', 'Doe'

case person2
in name: 'John', surname:
  p name, surname
end
