def decode_string(s)
  str_stack = []
  num_stack = []
  cur_str = ''
  cur_num = 0

  s.each_char do |char|
    if char =~ /\d/
      cur_num = cur_num * 10 + char.to_i
    elsif char == '['
      num_stack << cur_num
      str_stack << cur_str
      cur_str = ''
      cur_num = 0
    elsif char == ']'
      num = num_stack.pop
      str = str_stack.pop
      cur_str = str + cur_str * num
    else
      cur_str += char
    end
  end
  cur_str
end

# s = '2[abc]3[cd]ef'
# accaccacc
# s = "100[leetcode]"
s = '3[a2[c]]'
p decode_string s
