def sing(number)
  puts "#{number} bottles of beer on the wall,"
  puts "#{number} bottles of beer."
  puts "Take one down, pass it around,"
  puts "#{number - 1} bottles of beer on the wall."
end

99.downto(1).each do |number|
  sing(number)
end
