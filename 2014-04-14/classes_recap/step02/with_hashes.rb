kilometers = {} # Counter.new
kilometers[:count] = 0 # kilometers.start
kilometers[:count] = kilometers[:count] + 1
kilometers[:count] = kilometers[:count] + 1
kilometers[:count] = kilometers[:count] + 1
puts "the counter is #{kilometers[:count]}"

steps = {} # Counter.new
steps[:count] = 5 # steps.start
steps[:count] = steps[:count] + 1
puts "the counter is #{steps[:count]}"


puts "you have walked #{kilometers[:count]} kilometers and #{steps[:count]} steps"
