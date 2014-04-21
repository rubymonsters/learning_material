class Counter
  def initialize(initial_value)
    @count = initial_value
  end

  def add_one
    @count = @count + 1
  end

  def show_results
    puts "the counter is #{count}"
  end

  def count
    @count
  end
end

kilometers = Counter.new(0)
kilometers.add_one
kilometers.add_one
kilometers.add_one
kilometers.show_results

steps = Counter.new(5)
steps.add_one
steps.show_results

puts "you have walked #{kilometers.count} kilometers and #{steps.count} steps"

