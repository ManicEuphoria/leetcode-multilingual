# 530. 二叉搜索树的最小绝对差
# 给你一个二叉搜索树的根节点 root ，返回 树中任意两不同节点值之间的最小差值 。
# 差值是一个正数，其数值等于两值之差的绝对值。
# link: https://leetcode.cn/problems/minimum-absolute-difference-in-bst/

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
# @return {Integer}
def get_minimum_difference(root)
  min_diff = Float::INFINITY
  prev = nil

  traverse = nil
  traverse = lambda do |node|
    return if node.nil?

    # 中序遍历，先找到最左边的叶子节点，用叶子节点的值和当前节点的值计算差值
    traverse.call(node.left)

    unless prev.nil?
      min_diff = [min_diff, (prev.val - node.val).abs].min
    end
    prev = node
    traverse.call(node.right)
  end

  traverse.call(root)
  min_diff
end