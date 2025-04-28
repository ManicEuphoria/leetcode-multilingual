# Problem: 面试题17.14-最小k个数
# 题目描述: 设计一个算法，找出数组中最小的k个数。以任意顺序返回这k个数均可。
# link: https://leetcode.cn/problems/smallest-k-lcci/

def smallest_k(nums, k)
  return [] if nums.empty?

  collections = Hash.new { |k, v| k[v] = [] }
  nums.each { |n| collections[n] << n }

  res = []
  collections.keys.sort.each do |key|
    res += collections[key]
    return res[0, k] if res.size >= k
  end

  res[0, k]
end
