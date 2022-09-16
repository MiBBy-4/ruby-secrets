module AnimalModule
  def speak
    p "#{self.class.name} can't talk really..."
  end
end

class Animal
  # Include used for include modules in class, also like a extend
  # Main difference is that extended modules will be accessed in singleton classes 
  # include AnimalModule
  # Prepend used to change a chain of inheritance
  # So, if we will look at ancestors of Cat, it will look like
  # (Cat -> AnimalModule -> Animal -> Object -> Kernel -> BasicObject)
  prepend AnimalModule

  def speak
    p '... said animal'
  end
end

class Cat < Animal
  def speak
    p 'Meow!'
  end
end

cat = Cat.new
# Logic of this is that Ruby is searching method speak at the first in Cat class
# If class doesn't include method, Ruby goes upper in chain of inheritence
# (Cat -> Animal -> AnimalModule -> Object -> Kernel -> BasicObject)
cat.speak

# All parents for Cat class
p 'ANCESTORS FOR CAT:'
p Cat.ancestors
