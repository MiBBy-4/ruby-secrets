# For example we got some personal data about characher
data = {
  name: 'Ivan',
  surname: 'Ivanov',
  extra: {
    age: '20',
    hobby: 'computer games'
  }
}
# That means that we are waiting name and age data from our hash
case data
# Name of this is template and it means that at the first we are waiting key name, after this we are waiting
# key extra and key age in extra
# But we also can rename variable that will be keep our information, for example for age
in { name:, extra: {age: ivan_age} }
  # If we data got from hash then code below will be execute
  # Deeply, if keys was find then key name will be put in variable name,
  # the same with age
  p name
  p ivan_age
# But if data is not found, code will not be execute and Ruby will go to next tamplate or throw exception
in extra: { university: }
  p university
# To finish our case without exceptions we can use else, that will execute
# if no one matching will be find
else
  puts 'No match'
end

# In Ruby we have a few ways to get pattern matching
# That called one-line pattern matching
# But it is experimental in Ruby 3.0
data => { surname:, extra: {hobby: } }
p surname, hobby
