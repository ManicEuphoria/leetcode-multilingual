def subarray_sum(nums, k)
  count = sum = 0
  hash = { 0 => 1 }

  nums.each do |num|
    sum += num
    count += hash[sum - k] || 0 
    hash[sum] = (hash[sum] || 0) + 1
  end

  count
end
