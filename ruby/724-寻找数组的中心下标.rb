# 724. 寻找数组的中心下标
# 给定一个整数数组 nums，请编写一个能够返回数组 “中心下标” 的方法。
# 例子：
# 输入：nums = [1, 7, 3, 6, 5, 6]
# 输出：3
# 解释：
# 中心下标是 3。
# 在该位置，数组左边元素之和 sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
# 数组右边元素之和 sum = nums[4] + nums[5] = 5 + 6 = 11
# 所以返回 3，因为 3 是中心下标。
# link: https://leetcode-cn.com/problems/find-pivot-index/

def pivot_index(nums)
  sums = 0
  prefix_sum = [0]

  nums.each do |n|
    sums += n
    prefix_sum << sums
  end

  1.upto(prefix_sum.size - 1).each do |i|
    diff = prefix_sum.last - prefix_sum[i]
    return i - 1 if diff == prefix_sum[i - 1]
  end

  -1
end
