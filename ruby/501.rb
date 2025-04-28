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
# @return {Integer[]}
def find_mode(root)
  res = Hash.new(0)

  mode = nil
  mode = lambda do |node|
    return if node.nil?

    res[node.val] += 1
    mode.call(node.left)
    mode.call(node.right)
  end
  mode.call(root)

  max_mode = res.values.max
  node = res.select { |_, v| v == max_mode }
  node.keys
end
