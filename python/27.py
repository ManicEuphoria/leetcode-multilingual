# Problem 27: Remove Element
# Difficulty: Easy
# Category: Array, Two Pointers
# Link: https://leetcode.cn/problems/remove-element/
#
# 题目描述：
# 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

from typing import List

class Solution:
    def remove_element(self, nums: List[int], val: int) -> int:
        n = 0 # 设置一个指针指向数组开头
        while n <= len(nums) - 1: # 循环条件为n不能大于数组最后一个元素的index
            if nums[n] == val: # 当nums[n] == val时，原地删除指针n处对应的元素，此时数组中n+1处的元素跑到了n处，所以要n-=1不漏过该元素
                nums.pop(n)
                n -= 1
            n += 1 # 每次循环，让指针n+=1向右移动
        return len(nums)
