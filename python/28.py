class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        head, tail = 0, len(needle)

        while tail <= len(haystack):
            if haystack[head:tail] == needle:
                return head
            else:
                head += 1
                tail += 1
        return -1


# haystack = "mississippi"
# needle = "issip"
haystack = "c"
needle = "c"

print(Solution().strStr(haystack, needle))