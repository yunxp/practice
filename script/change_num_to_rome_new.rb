# COMPARSION = { '1'=>'I', '4'=>'IV', '5'=>'V', '9'=>'IX', '10'=>'X', '50'=>'L', '100'=>'C', '500'=>'D', '1000'=>'M' }
BIT_1 = {1=>'I', 4=>'IV', 5=>'V', 9=>'IX'}
BIT_2 = {1=>'X', 4=>'XL', 5=>'L', 9=>'XC'}
BIT_3 = {1=>'C', 4=>'CD', 5=>'D', 9=>'CM'}
BIT_4 = {1=>'M'}

def translate(num)
  rst = ''
  num_s = ("%04d" % num).split(//)
  num_s.each_with_index do |s, index|
  	rst += get_num(Object.const_get("BIT_#{num_s.size - index}"), s.to_i)
  end
  rst
end

def get_num(bit, num)
  rst = ''
	return rst if num == 0
  nums = bit.keys.sort.reverse
  nums.each do |n|
  	if num == n
  		rst = bit[n]
  		break
  	elsif num > n
  		rst += bit[n]
  		rst += get_num(bit, num - n)
  		break
  	end
  end
  rst
end

puts translate(ARGV[0].to_i)
