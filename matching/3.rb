ages = [20, 18]
# ages = [20, 18, 21]

# For example we got an array with two ages
# In this matching we are waiting two integers and it will be correct comparison
case ages
  # But if we got more than two numbers in our array it will say 'Incorrect!'
# in Integer, Integer
# To solve this problem we need to use '*' after need amount of Integers
in [Integer, Integer, *]
  p 'Correct!'
else
  p 'Incorrect!'
end

case {ivan: 20, john: 18, vasilii: 21, sergey: 10}
# For example, I want to find comparison only for Ivan and John and other information don't care
# For hashes we need to use double '*'. It is a Ruby ;)
# in {ivan:, john:, **}
# But for hashes we can skip double '*', cause only for arrays we need to use '*'
# It works too
# in {ivan:, john:}
# And one more! If I need values of Ivan and John, and other information like key-value
# then I need to put name of variable which will keep that other information after double '*'
# The same way we have and for arrays (after '*' we need to put a variable)
in { ivan:, john:, **others }
  p ivan, john # => 20, 18
  p others # => {:vasilii=>21, :sergey=>10}
else
  p 'Incorrect!'
end
