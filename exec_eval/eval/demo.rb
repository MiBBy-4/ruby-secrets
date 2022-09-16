p 'Enter your code ...'
# puts 1+2
code = gets

# Eval is a special method which get string and exec this string like a code of Ruby
# DAMN!
# BUT IT IS BAD WAY OF SECURITY
eval code
# Result is 3
