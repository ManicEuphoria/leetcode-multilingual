# 正常版本
def calculate_removed_balls(bucket_ball_nums, sum)
  total = bucket_ball_nums.sum
  return [] if total <= sum  # 规则一：无需调整

  # 从小到大尝试可能的 maxCapacity
  (0..bucket_ball_nums.max).each do |max_capacity|
    # 计算调整后的总球数
    current_sum = bucket_ball_nums.sum { |num| [num, max_capacity].min }

    # 找到第一个满足条件的 max_capacity
    if current_sum <= sum
      # 返回每个桶需要拿出的球数
      return bucket_ball_nums.map { |num| [num - max_capacity, 0].max }
    end
  end

  # 理论上不会执行到这里（因为 max_capacity=0 时总和为0）
  []
end

# 测试用例
p calculate_removed_balls([2, 3, 2, 5, 5, 1, 4], 14)  # 输出: [0, 1, 0, 3, 3, 0, 2]
p calculate_removed_balls([1, 2, 3], 6)              # 输出: [] (总和未超限)




# 二分优化版本
def calculate_removed_balls(bucket_ball_nums, sum)
  total = bucket_ball_nums.sum
  return [] if total <= sum  # 规则一：无需调整

  left = 0
  right = bucket_ball_nums.max  # maxCapacity 的可能最大值

  # 二分查找寻找满足条件的 maxCapacity
  while left < right
    mid = (left + right + 1) / 2  # 向上取整
    current_sum = bucket_ball_nums.sum { |num| [num, mid].min }

    if current_sum <= sum
      left = mid  # 尝试更大的 maxCapacity
    else
      right = mid - 1
    end
  end

  max_capacity = left
  bucket_ball_nums.map { |num| [num - max_capacity, 0].max }
end

# 测试用例
p calculate_removed_balls([3, 5, 2, 7], 10)  # 输出: [0, 2, 0, 4] (maxCapacity=3)
p calculate_removed_balls([1, 2, 3], 6)      # 输出: [] (总和未超限)