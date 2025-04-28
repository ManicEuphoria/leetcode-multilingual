# Problem: 128. 最长连续子序列
# link: https://leetcode.cn/problems/longest-consecutive-sequence/

# 时间复杂度O(n)解法，使用字典，空间复杂度最坏情况下O(n)
def longest_consecutive(nums)
  nums_set = {}
  nums.each { |n| nums_set[n] = 1 } # 去重并记录每一个数字

  max_length = 0
  nums_set.each_key do |n|
    next if nums_set.key?(n - 1) # 如果当前数字的前一个数字存在，则跳过

    current_num = n # 设定临时变量指向当前数字n
    current_length = 1 # 循环里设定一个临时长度
    while nums_set.key?(current_num + 1) # 如果当前数字的后一个数字存在，则循环
      current_num += 1 # 当前数字加1
      current_length += 1 # 临时长度加1
    end
    max_length = [max_length, current_length].max # 更新最大长度
  end
  max_length
end

# 不使用字典，使用排序，时间复杂度O(nlogn)，空间复杂度O(1)
def longest_consecutive(nums)
  return 0 if nums.empty?

  nums.sort!
  max_length = 1 # 已排除空数组的情况，最短数组为1，则最小长度从1开始
  current_length = 1 # 同理

  (1..nums.size - 1).each do |i|
    next if nums[i] == nums[i - 1] # 跳过重复元素

    if nums[i] == nums[i - 1] + 1 # 如果当前数字等于前一个数字加1，则长度加
      current_length += 1
    else
      current_length = 1 # 如果当前数字不等于前一个数字加1，则重置临时长度
    end
    max_length = [max_length, current_length].max # 更新最大长度
  end
  max_length
end
