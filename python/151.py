# Problem 151: Reverse Words in a String
# Difficulty: Medium
# Category: String
# Link: https://leetcode.cn/problems/reverse-words-in-a-string/
#
# 题目描述：
# 给定一个字符串 s ，请你反转字符串中 单词 的顺序。
# 单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。
# 返回一个反转 s 中单词顺序并用单个空格相连的字符串。

class Solution:
    def reverseWords(self, s: str) -> str:
        s = s.split(' ')
        s = [char for char in s if char.strip()]

        head, tail = 0, 0
        while head < tail:
            s[head], s[tail] = s[tail], s[head]
            head += 1
            tail += 1

        return " ".join(s)
