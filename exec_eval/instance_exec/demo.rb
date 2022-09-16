str = 'madam'

# instance_exec used for exec some code for instances
str.instance_exec do
  def palindrome?
    str_no_spaces = self.gsub(/\s/, '')
    str_no_spaces == str_no_spaces.reverse
  end
end

puts str.palindrome?
