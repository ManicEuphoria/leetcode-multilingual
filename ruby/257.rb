# 257. 二叉树的所有路径
# 给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。
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
# @return {String[]}
def binary_tree_paths(root)
  res = []
  recr_path(root, res, '')
  res
end

def recr_path(root, res, path)
  return if root.nil?

  path += root.val.to_s

  res << path if root.left.nil? && root.right.nil?

  path += '->'
  recr_path(root.left, res, path)
  recr_path(root.right, res, path)
end
