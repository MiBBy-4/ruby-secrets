require_relative 'request'

# Logic of this is like a ActiveRecord
class BaseModel
  extend Request
  def initialize(params)
    # Dynamicly creates variables(methods) that come from params
    params.each do |k, v|
      self.instance_variable_set "@#{k}", v
    end
  end
  class << self
    # Dynamic method that accept names of methods and dymamicly creates it on Class
    def supports(*methods)
      methods.each do |method|
        # "Magic" method of Ruby that defines method on class
        # In argument of block we use params which will throw like arguments of method
        define_method method do |params = {}|
          # We just delegate on already created methods
          self.class.send method, params.merge(id: self.id)
        end
      end
    end
    # This method throw params in post method, 
    # that returns this params back and on this params we create a new object of class
    def create(params)
      new post(params)
    end

    def update(params)
      new patch(params.delete(:id), params)
    end

    def destroy(params)
      delete(params[:id])
    end
  end
end
