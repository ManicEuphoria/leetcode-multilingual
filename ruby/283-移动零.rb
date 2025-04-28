# Problem: 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
#          请注意 ，必须在不复制数组的情况下原地对数组进行操作。
#
# link: https://leetcode.cn/problems/move-zeroes/
# nums = [0, 1, 0, 3, 12]
nums = [0,0]

def move_zeroes(nums)
  return [] if nums.empty?

  n = nums.size - 1

  ops = 0
  i = 0
  while ops < n
    if nums[i] != 0
      i += 1
      ops += 1
      next
    end

    while nums[i].zero?
      nums << 0
      nums.delete_at(i)
      ops += 1
      break if ops >= n
    end
  end
  nums
end

p move_zeroes nums
