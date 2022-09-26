case { ivan: 20, john: 18, vasilii: 21, sergey: 10 }
# We can also compare types like in an array
# But to put data in variable we need to explicitly name this variable
in { ivan: Integer => ivan_age}
  p ivan_age
end

# To compare hash on numbers of elements we need simply use '**nil'
case { ivan: 20, john: 18, vasilii: 21, sergey: 10 }
  in { ivan:, **nil}
    p ivan # In this case returns error exception, cause we are waiting only one element in our hash
  end
  
