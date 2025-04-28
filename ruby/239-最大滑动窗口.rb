def max_sliding_window(nums, k)
  queue = []
  res = []

  nums.size.times do |i|
    maintain_window(queue, nums, i, k)
    res << nums[queue.first] if i >= k - 1
  end
  res
end

def maintain_window(queue, nums, i, k)
  queue.shift if queue.first == i - k
  queue.pop while !queue.empty? && nums[queue.last] < nums[i]
  queue << i
end

a = [1, 3, -1, -3, 5, 3, 6, 7]
k = 3

p max_sliding_window(a, k)
