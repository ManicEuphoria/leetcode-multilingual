# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # 使用哈希表记录字符最后出现的位置
  last_seen = {}
  max_length = 0
  window_start = 0

  s.each_char.with_index do |char, window_end|
    # 如果字符已经出现过，并且在窗口内（窗口从下标0开始，如果重复字符出现，则将窗口开始调整为上一次出现这个字符的后一个字符）
    window_start = last_seen[char] + 1 if last_seen.key?(char) && last_seen[char] >= window_start
    # 将字符出现的位置加入哈希表
    last_seen[char] = window_end
    # 计算当前无重复窗口最大值
    current_length = window_end - window_start + 1
    # 更新全局最大值
    max_length = [max_length, current_length].max
  end
  max_length
end
