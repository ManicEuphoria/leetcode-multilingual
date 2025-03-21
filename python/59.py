from typing import List


class Solution:
    def generateMatrix(self, n: int) -> List[List[int]]:
        matrix = [[0] * n for _ in range(n)]
        top, bottom = 0, n - 1
        left, right = 0, n - 1
        val = 1

        while top <= bottom and left <= right:
            for i in range(left, right + 1):
                matrix[top][i] = val
                val += 1
            top += 1

            for i in range(top, bottom + 1):
                matrix[i][right] = val
                val += 1
            right -= 1

            for i in range(right, left - 1, -1):
                matrix[bottom][i] = val
                val += 1
            bottom -= 1

            for i in range(bottom, top - 1, -1):
                matrix[i][left] = val
                val += 1
            left += 1
        return matrix