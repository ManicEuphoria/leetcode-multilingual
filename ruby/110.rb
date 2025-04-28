# https://leetcode.cn/problems/balanced-binary-tree/
# 给定一个二叉树，判断它是否是高度平衡的二叉树。
# 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。

# 解法一
def is_balanced(root)
  height(root) != -1
end

def height(root)
  return 0 if root.nil?

  left = height(root.left)
  return -1 if left.negative?

  right = height(root.right)
  return -1 if right.negative?

  (left - right).abs > 1 ? -1 : [left, right].max + 1
end
