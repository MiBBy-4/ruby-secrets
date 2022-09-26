# ages = [28, 30, 35, 42, 50]

# case ages
# in [Integer => age1, Integer => age2, *others]
#   p age1, age2
# end

data = {
  name: 'Sergey',
  surname: 'Glyad',
  extra: {
    age: '30',
    hobby: 'sleeping'
  }
}

# Underscore means that value is not important
case data
in name: _, surname:
  p surname
end
