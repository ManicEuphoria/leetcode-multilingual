# 404. 左叶子之和
# 给定二叉树的根节点 root ，返回所有左叶子之和。

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
def sum_of_left_leaves(root)
  sums = 0

  sum_left = lambda do |node, parent_node|
    return sums if node.nil?

    # 如果父节点存在，并且父节点的左节点是当前节点，并且当前节点的左右节点都为空，那么当前节点就是左叶子节点
    if parent_node && parent_node.left == node && node.left.nil? && node.right.nil?
      sums += node.val
    end

    # 递归遍历左子树和右子树
    sum_left.call(node.left, node)
    sum_left.call(node.right, node)
  end
  sum_left.call(root, root)
  sums
end
