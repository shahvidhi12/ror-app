class Table
  
  def multi_num(user_input, range)
    num = user_input.to_i
    (1..range).each do |i|
      num1 = num * i
      puts "#{num} * #{i} = #{num1}"
    end
  end
end

print "Enter The One Number: "
user_input = gets.chomp


if user_input.match?(/^(?!0$)\d+$/)
  print "Enter the range: "
  range_input = gets.chomp.to_i
  
  d1 = Table.new
  d1.multi_num(user_input, range_input)
else
  puts "Please enter a valid number."
end
