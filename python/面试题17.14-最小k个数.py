# Problem: 面试题17.14-最小k个数
# 题目描述: 设计一个算法，找出数组中最小的k个数。以任意顺序返回这k个数均可。
# link: from collections import defaultdict
from typing import List
from collections import defaultdict

class Solution:
    def smallestK(self, arr: List[int], k: int) -> List[int]:
        if k == 0:
            return []
        
        # 构建哈希表
        hash = defaultdict(list)
        for num in arr:
            hash[num].append(num)
        
        # 排序键值并收集结果
        res = []
        for key in sorted(hash.keys()):
            res.extend(hash[key])
            if len(res) >= k:
                return res[:k]
        return res[:k]



        
