# Problems of Monkey patching are when we define method of Class for example in gem
# and user uses this gem and don't how generely work gem and try to define the same method
# he will break this gem
class String
  # This method has priority on method that defined on Sting class in string.rb
  # And it will break our method that used on gem
  def snakecase
    #TODO: implement later
  end
end
