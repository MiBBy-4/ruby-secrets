require_relative 'request'

class Endpoint
  include Request
  attr_reader :path, :params


  def initialize(path, params)
    @path = path
    @params = params
  end

  # First way of delegate
  # This method will delegate work to 'get' method from Request module
  # def do_get
  #   get @path, @params
  # end

  # def do_post
  #   post @path, @params
  # end

  private

  METHOD_REGEXP = /\Ado_(get|post|put)\z/

  # Second way of delegate
  # And we can also delegate with metaprogramming
  # Method missing is in help
  def method_missing(method, *_args)
    if method.to_s =~ METHOD_REGEXP
      send Regexp.last_match(1), @path, @params
    else
      super
    end
  end

  def respond_to_missing?(method, _include_all)
    return true if METHOD_REGEXP.match?(method.to_s)

    super
  end
end
