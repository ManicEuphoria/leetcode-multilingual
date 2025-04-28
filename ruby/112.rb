# https://leetcode.cn/problems/path-sum/
# 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。
# 如果存在，返回 true ；否则，返回 false 。
# 叶子节点 是指没有子节点的节点。

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  return false if root.nil?
  node_sum = 0
  dfs(root, node_sum, target_sum)
end

def dfs(node, node_sum, target_sum)
  return false if node.nil?
  node_sum += node.val
  return node_sum == target_sum if node.left.nil? && node.right.nil?
  
  left = dfs(node.right, node_sum, target_sum)
  return true if left
  right = dfs(node.left, node_sum, target_sum)
  return true if right
  false
end

# 简化版本的dfs
def dfs(node, node_sum, target_sum)
  return false if node.nil?

  node_sum += node.val
  return node_sum == target_sum if node.left.nil? && node.right.nil?

  dfs(node.right, node_sum, target_sum) || dfs(node.left, node_sum, target_sum)
end
