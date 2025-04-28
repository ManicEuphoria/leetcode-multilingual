# link: https://leetcode.cn/problems/minimum-value-to-get-positive-step-by-step-sum/description/?envType=problem-list-v2&envId=prefix-sum

# @param {Integer[]} nums
# @return {Integer}
def min_start_value(nums)
  sums = 0
  min_positive = 1 # 最小正数为1

  nums.each do |n|
    # 先计算累积和
    sums += n
    # 当累积和与最小正数想加小于等于0时，因要满足题目条件最小正数依次与数组中元素想加的和不能小于1
    # 因此对此时的累积和取负数再加1，再与上一轮的最小正数做比较（取两者之间最大的，否则不能满足条件）
    min_positive = [min_positive, -sums + 1].max if sums + min_positive <= 0
  end
  min_positive
end

