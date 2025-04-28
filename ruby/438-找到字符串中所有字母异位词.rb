# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  p_count = Hash.new(0)
  s_count = Hash.new(0)
  p.each_char { |c| p_count[c] += 1 }

  l = 0
  res = []
  s.each_char.with_index do |c, r|
    s_count[c] += 1

    if r - l + 1 == p.size # 此刻开始，窗口长度一直等于p字符串的长度
      res << l if s_count == p_count # 当计数器内容相等时，把index加入结果集
      s_count[s[l]] -= 1 # 加入结果集后，可以将左边界的字符减去一个计数
      s_count.delete(s[l]) if s_count[s[l]].zero? # 当左边界的字符计数为0时，将其删除，避免后续哈希比较
      l += 1 # 移动左边界
    end
  end

  res
end

s = 'cbaebabacd'
pi = 'abc'

p find_anagrams(s, pi)
