ages = [20, 18, 21]

ivan_age = 18

# To compare value with variable and keep it variable in case, we need to use '^'
case ages
in ivanov_age, ^ivan_age, *other_ages
  p ivanov_age
  p ivan_age
end

users = [:ok,
  [
    {
      name: 'Ivan',
      surname: 'Ivanov',
      extra: {
        age: '20',
        hobby: 'computer games'
      }
    },
    {
      name: 'John',
      surname: 'Doe',
      extra: {
        age: '18',
        hobby: 'do sport'
      }
    }
  ]
]

name = 'John'

case users
# Find pattern
# That means we can find value from our hash with pattern
# This feature is also experimental
in :ok, [*, { name: ^name, extra: {age:} }, *]
  p name, age
end

# For example we need to find user with required parameter in hash
new_users = {
  required_name: 'John', # required parameter
  users: [
    {
      name: 'Ivan',
      surname: 'Ivanov',
      extra: {
        age: '20',
        hobby: 'computer games'
      }
    },
    {
      name: 'John',
      surname: 'Doe',
      extra: {
        age: '18',
        hobby: 'do sport'
      }
    }
  ]
}

# So, to find with parameter in hash we need to use find pattern
# There we get required_name and puts it in variable and after that we use it like find pattern
case new_users
in required_name:, users: [*, {name: ^required_name, extra: {age:}}, *]
 p "#{required_name} is #{age}"
end
