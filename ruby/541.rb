
# 解法1: 通过取模得到可以被k*2整除的片段，处理完片段，再处理尾部
def reverse_str(s, k)
  len = s.length
  modulo = len % (k * 2)
  head, tail = 0, k - 1
  divisible = len - modulo

  while tail < divisible
    s[head..tail] = reverse(s[head..tail])
    head += k * 2
    tail += k * 2
  end

  return s if modulo.zero?
  
  if modulo > k
    s[divisible..divisible+k-1] = reverse(s[divisible..divisible+k-1])
  else
    s[divisible..-1] = reverse(s[divisible..-1])
  end
  s
end

def reverse(s)
  head, tail = 0, s.length - 1
  while head < tail
      s[head], s[tail] = s[tail], s[head]
      head += 1
      tail -= 1
  end
  s
end


# 解法2: 通过步长处理整个字符串
def reverse_str(s, k)
  len = s.size
  (0...len).step(2 * k) do |i|]
    left = i
    right = [i + k - 1, len - 1].min
    while left < right
      s[left], s[right] = s[right], s[left] # 原地交换字符x
      left += 1
      right -= 1
    end
  end
  s
end
