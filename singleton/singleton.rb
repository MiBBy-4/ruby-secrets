module FeedSomeone
  def feed
    p 'Mmm, yummy!'
  end
end

class Animal
  # Differences between include and extend are "include" only for instances of this class,
  # but extend for all inherited and singleton classes
  extend FeedSomeone
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # We can use self or name of class to decrale singletom nethod
  # Singletom methods are live in Signleton Classes
  def self.find(term = '') # or Animal.find
    p "Term to find animal: #{term}"
  end

  # Also we can use singleton class like this
  class << self
    # And in singleton classes like a default classes we can include modules
    # include FeedSomeone
    # We can also add attributes for our singleton classes and call them on out class
    attr_accessor :attr

    def hi
      p 'Hi! You are pretty good'
    end
  end
end

Animal.find 'Cat'

# To get information about singleton class of class need to use this method
p Animal.singleton_class

# Attributes of singleton class
Animal.attr = 'test'
p Animal.attr
# Call method of singleton class that was included with module
Animal.feed
