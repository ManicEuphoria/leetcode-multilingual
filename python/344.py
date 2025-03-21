# Problem 344: Reverse String
# Difficulty: Easy
# Category: Array
# Link: https://leetcode.cn/problems/reverse-string/
#
# 题目描述：
# 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。
# 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
from typing import List

class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        head, tail = 0, len(s) - 1

        while head < tail:
            s[head], s[tail] = s[tail], s[head]
            head += 1
            tail -= 1


s = ["h","e","l","l","o"]
Solution().reverseString(s)
print(s)