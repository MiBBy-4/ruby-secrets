# There we define new method on String class
# This is Monkey patching
# The main idea to add, change or delete method on defined Classes
class String
  def snakecase
    self.gsub(/([A-Z]+)(A-Z)[a-z]/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').tr('-', '_').gsub(/\s/, '_').gsub(/__+/, '_').downcase
  end
end
