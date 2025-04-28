# encoding: utf-8
# 303. 区域和检索 - 数组不可变
# 给定一个整数数组 nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i 和 j 两点。
# link: https://leetcode-cn.com/problems/range-sum-query-immutable/

# 前缀和数组说明：
# prefix_sum 的长度比 nums 多 1，所以需要 right + 1 和 left
# 例如：nums = [1, 2, 3, 4, 5]
# prefix_sum = [0, 1, 3, 6, 10, 15]
# 当 left = 1, right = 3 时，prefix_sum[right + 1] = prefix_sum[4] = 10
# prefix_sum[left] = prefix_sum[1] = 1
# 所以 sum_range = prefix_sum[right + 1] - prefix_sum[left] = 10 - 1 = 9
# 当 left = 2, right = 4 时，prefix_sum[right + 1] = prefix_sum[5] = 15
# prefix_sum[left] = prefix_sum[2] = 3
# 所以 sum_range = prefix_sum[right + 1] - prefix_sum[left] = 15 - 3 = 12

class NumArray
  # :type nums: Integer[]
  def initialize(nums)
    @prefix_sum = [0]
    sum = 0
    nums.each do |n|
      sum += n
      @prefix_sum << sum
    end
  end

  # :type left: Integer
  # :type right: Integer
  # :rtype: Integer
  def sum_range(left, right)
    @prefix_sum[right + 1] - @prefix_sum[left]
  end
end
