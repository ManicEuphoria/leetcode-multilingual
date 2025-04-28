# Problem: 15. 三数之和
# link: https://leetcode.cn/problems/3sum/

# 我的解法，类似暴力破解，时间复杂度接近n**3
nums = [-1,0,1,2,-1,-4]

def three_sum(nums)
  return nums if nums.sum.zero? && nums.size == 3 || nums.empty?

  nums = nums.sort
  # 通过这行代码，判断排序后第一个元素是否为正数 / 最后一个元素是否为负数，避免进入后续循环
  return [] if nums.first.positive? || nums.last.negative?

  # 初始化结果集合，头指针和尾指针
  result = Set.new
  head   = 0
  tail   = nums.size - 1

  # 循环开始
  loop do
    # 这里的判断条件是，当head一直++，直到取到的nums[head]是一个正数时
    break if nums[head].positive?

    two_sums = nums[head] + nums[tail]

    head += 1 if nums[head] > -two_sums
    tail -= 1 if nums[tail] < two_sums

    (head + 1).upto(tail - 1).each do |i|
      three_sum = [nums[head], nums[i], nums[tail]].sum
      if three_sum.zero?
        result << [nums[head], nums[i], nums[tail]]
        break
      end
    end

    tail -= 1
    tail = nums.size - 1 if tail - head < 2
  end

  result.to_a
end


# 时间复杂度为n**2的解法
def three_sum(nums)
  return [] if nums.empty?

  nums.sort!
  result = []

  (0..nums.size - 3).each do |i|
    # 跳过重复元素
    next if i.positive? && nums[i] == nums[i - 1]

    # 如果最小的数已经是正数，不可能有和为0的三元组
    break if nums[i].positive?

    # 剪枝
    break if [nums[i], nums[i + 1], nums[i + 2]].sum.positive?

    break if [nums[i], nums[-1], nums[-2]].sum.positive?

    left = i + 1
    right = nums.size - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum.negative?
        left += 1
      elsif sum.positive?
        right -= 1
      else
        result << [nums[i], nums[left], nums[right]]

        # 跳过重复元素
        left += 1 while left < right && nums[left] == nums[left-1]
        right -= 1 while left < right && nums[right] == nums[right+1]

        left += 1
        right -= 1
      end
    end
  end

  result
end
