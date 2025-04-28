
# 如何将一个10进制的整数转换为2进制？
def int2_binary(i)
  binary_digits = []
  while i > 0
    remainder = i % 2
    binary_digits.unshift remainder
    i /= 2
  end
  binary_digits.join
end

i = 9
bin = int2_binary(i)
p bin
# p bin.count('1')