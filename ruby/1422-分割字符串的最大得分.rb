# link: https://leetcode.cn/problems/maximum-score-after-splitting-a-string/description/?envType=problem-list-v2&envId=prefix-sum

# @param {String} s
# @return {Integer}
def max_score(s)
  ones = s.count('1') # 计算1的总数
  zeros = 0
  score = 0

  # 为什么这里要用s.size - 1?
  # 遍历字符最多到s[-2]的位置时，已经构成最后一个子串组合：s[0..-2] 与s[-1]
  # 至于s[-1]的位置时0还是1并不重要，如果是0，则zeros不会增加，属于右边的0不增加计数
  # 如果是1，ones也不会减少，因为属于右边的1不减少计数
  (s.size - 1).times do |i|
    if s[i] == '0'
      zeros += 1
    elsif s[i] == '1'
      ones -= 1
    end
    score = [score, zeros + ones].max
  end
  score
end
