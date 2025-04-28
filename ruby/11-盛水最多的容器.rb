# Problem 11. 盛水最多的容器

# 给定一个数组，数组中的每个元素代表一个高度，求出数组中两个元素所能构成的面积最大的容器。
# link: https://leetcode.cn/problems/container-with-most-water/


# 暴力解法，时间复杂度 O(n^2)， 空间复杂度 O(1)，leetcode中运行会超时，但是解法比较直观
# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_capacity = 0

  left = 0
  while left <= height.size - 2
    right = left + 1
    loop do
      if right > height.size - 1
        right = 0
        break
      end
      max_capacity = [max_capacity, [height[left], height[right]].min * (right - left)].max
      right += 1
    end
    left += 1
  end

  max_capacity
end

# 双指针解法，时间复杂度 O(n)， 空间复杂度 O(1)
def max_area_v2(height)
  left = 0
  right = height.size - 1
  max_capacity = 0

  while left < right
    max_capacity = [max_capacity, [height[left], height[right]].min * (right - left)].max
    height[left] < height[right] ? left += 1 : right -= 1 # 移动较小的那个指针
  end
  max_capacity
end

height = [1, 1]

p max_area height
