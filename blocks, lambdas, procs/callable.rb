# procs and lambdas are blocks of code which we can save for next using

# Two variants of creating proc
my_proc = Proc.new { |msg| p msg }
# my_proc = proc { |msg| p msg }

# And two variants of creating lambda
my_lambda = lambda { |msg| p msg }
# my_lambda = ->(msg) { p msg } # stabby lambda

# my_proc.call('Hello GitHub!')

# my_lambda.call('Hello world!')

# Difference between lambda and proc are proc returns not only from block of code, also from method where it calls
# lambda checks number of arguments and proc is not
def my_method(callable)
  result = callable.call('Hello world!')

  p "The result is #{result}"
  p "I have called #{callable.inspect}"
end

my_method(my_lambda)

my_method(my_proc)
