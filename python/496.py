# Problem 496: Next Greater Element I
# Difficulty: Easy
# Category: Array
# Link: https://leetcode.cn/problems/next-greater-element-i/
#
# 题目描述：
# 给定两个没有重复元素的数组 nums1 和 nums2 ，其中 nums1 是 nums2 的子集。找到 nums1 中每个元素在 nums2 中的下一个更大元素。
# nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，则输出 -1。

from typing import List

# O(n*m) solution
class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        nums1_index = {num: i for i, num in enumerate(nums1)}
        res = [-1] * len(nums1)

        for i in range(len(nums2)):
            if nums2[i] not in nums1_index:
                continue
            for j in range(i+1, len(nums2)):
                if nums2[j] > nums2[i]:
                    idx = nums1_index[nums2[i]] # 比如nums1= [4,1,2], nums2 = [2,1,3,4], nums2[i] = 1, nums1_index[1] = 0
                    res[idx] = nums2[j] # res[0] = 3
                    break
        return res
    
# O(n+m) solution - 单调栈解法
class Solution2:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        # 将nums1的元素和它的index映射为一个字典，比如nums1是[2,1,4], 则nums1_index为 {2: 0, 1: 1, 4: 2}
        nums1_index = {num: i for i, num in enumerate(nums1)}
        res = [-1] * len(nums1)

        stack = []
        for i in range(len(nums2)):
           cur = nums2[i]

           # 递增单调栈（数组头为底，尾为顶）的精髓：当栈内有元素，且即将入栈的元素大于栈顶元素时，需要将栈顶元素pop出来，直到满足栈顶元素没有比入栈元素大为止
           while stack and cur > stack[-1]: 
               val = stack.pop() # 当满足了入栈元素比栈顶元素大的逻辑，则会pop出栈顶元素
               # 此时为什么要将pop出的val的index取出来，然后将cur赋值到结果集对应的位置上？
               # 在上一个循环里，入栈的元素存在于nums1里（nums1是nums2的子集，因此一定有存在于nums2里但不存在nums1里的元素）。这时cur比栈顶元素大，说明什么？
               # 说明找到nums1的元素"a"在nums2[i]这个位置的下一个元素，而这个元素比"a"大！此时，我们就要获取这个val（前一个入栈的栈顶元素）在nums1中的index，
               # 然后，将cur（比x大的元素）赋值到结果集nums1的val对应的index上。
               idx = nums1_index[val]
               res[idx] = cur
           
           # 为什么入栈要放在末尾？因为在同一个循环中，如果入栈放在while之前，则cur入栈以后，cur>stack[-1]的逻辑就变成了cur和自己比大小。
           # 而单调栈的目的，是为了入栈的元素和前一个入栈的栈顶的元素比对大小，所以逻辑上来说，这就是错的。所以必须要将入栈步骤放在单个循环的末尾进行。
           if cur in nums1_index:
               stack.append(cur)
        return res
               
            

nums1 = [4, 1, 2]
nums2 = [1, 3, 2, 4]

print(Solution2().nextGreaterElement(nums1, nums2))