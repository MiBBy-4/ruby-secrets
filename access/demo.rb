require 'active_support/inflector/transliterate'
require 'cgi'

class Animal
  include ActiveSupport::Inflector
  # By default all methods and fields are public
  attr_reader :age, :name

  def initialize(name, age)
    @age = age
    @name = name
  end

  # That means all methods below this access modify will be private and only can be called in this class and inherited
  private

  def maximum_foody
    age > 2 ? 350 : 250
  end

  # But we can also personally use access for method
  # Method to_h will be public, but it placed under 'private' modify
  public def to_h
    {
      name: name,
      age: age
    }
  end
  # The main difference between private and protected that protected methods not only for 'self' way
  # We can call protected method on other object of this Class or inherited
  protected

  def to_param
    parameterize name
  end
end

class Cat < Animal
  def introduce
    p "I am #{name} and I'm #{age}"
  end

  def say_maximum_foody
    p "I can eat only #{maximum_foody}g"
  end

  def can_eat_more?(other_cat)
    # By the logic other_cat is an object of this class
    # But we can not use maximum_foody on this object, cause it is private method
    # It means that private methods we can use only in self context
    self.maximum_foody > other_cat.maximum_foody
  end

  def url_for
    "http://example.com/cats/#{to_param}"
  end

  def search_url_for(other_cat)
    # Method like a 'can_eat_more?', but it will be work, cause to_param is protecred method
    # And we can use it on other object
    params = CGI.escape "#{self.to_param},#{other_cat.to_param}"
    "http://example.com/cats?q=#{params}"
  end
end

cat = Cat.new 'Spot', 1
other_cat = Cat.new 'Mr.Buttons', 5

p cat.name, cat.age
other_cat.introduce

cat.say_maximum_foody
p cat.to_h
# p cat.can_eat_more?(other_cat)
p cat.search_url_for(other_cat)

# Also in Ruby way we can call method by two ways: by dot(object.method) and by .send(:method)
# But the main difference is that 'send' method can call private and protected methods
# Be carefull! ;)
# p cat.send(:maximum_foody)

# To get all public methods in Ruby we use public_methods method
# p cat.public_methods
# The same way with private and protected
# p cat.private_methods
