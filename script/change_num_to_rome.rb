COMPARSION = { '1'=> 'I', '5'=> 'V', '10'=> 'X', '50'=> 'L', '100'=> 'C', '500'=> 'D', '1000'=> 'M' }

def translate(number, result = "")
  return result if number == 0
  str_num = number.to_s
  length = str_num.length
  high = str_num[0].to_i
  if high < 4
    high.times { result << COMPARSION[(10**(length-1)).to_s] }
  elsif high == 4
    result << COMPARSION[(10**(length-1)).to_s]
    result << COMPARSION[(5*10**(length-1)).to_s]
  elsif high < 9
    result << COMPARSION[(5*10**(length-1)).to_s]
    (high-5).times { result << COMPARSION[(10**(length-1)).to_s] }
  elsif high == 9
    result << COMPARSION[(10**(length-1)).to_s]
    result << COMPARSION[(10**length).to_s]
  end
  str_num[0] = ''
  translate(str_num.to_i, result)
end

puts "Usage: ruby number_to_roman.rb number"
puts "Example: ruby number_to_roman.rb 566"


if ARGV.length != 1 || ARGV[0].to_i > 1000
  p 'invaid param'
else
  p  translate(ARGV[0].to_i)
end
