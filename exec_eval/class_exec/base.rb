# The main idea of class_exec is doing something in context of class
# Dynamicly doing code in context of class
class Base
  class << self
    # This method will be called when we inherit Base class
    def inherited(subclass)
      attrs = attributes_for subclass

      # All that we write in block of class_exec will be exec in subclass
      # In this way we just define getters of attributes 
      subclass.class_exec do
        attr_reader(*attrs)
      end
      # Also in ruby we have class_eval
      # The main difference of exec and eval that eval can get string like an argument
      # str = %q{ attr_reader(*args) }
      # subclass.class_eval str
    end

    private

    def attributes_for(klass)
      # Read methods name from json file
      @methods ||= Oj.load File.read('./methods.json')
      # Get list of methods for klass
      @methods[klass.to_s.downcase]
    end
  end
end
