class Counter
  def start
    @count = 0
  end

  def add_one
    @count = @count + 1
  end

  def show_results
    puts "the counter is #{@count}"
  end
end

kilometers = Counter.new
kilometers.start
kilometers.add_one
kilometers.add_one
kilometers.add_one
kilometers.show_results


steps = Counter.new
steps.start
steps.add_one
steps.show_results

