def min_depth(root)
  return 0 if root.nil?

  # 如果左子树为空,返回右子树深度+1
  return min_depth(root.right) + 1 if root.left.nil?

  # 如果右子树为空,返回左子树深度+1
  return min_depth(root.left) + 1 if root.right.nil?

  # 如果左右子树都不为空,取较小深度+1
  [min_depth(root.left), min_depth(root.right)].min + 1
end



# 另外一种解法
def min_depth(root)
  return 0 if root.nil?

  left_depth = min_depth(root.left)
  right_depth = min_depth(root.right)

  # 处理空子树的情况
  if left_depth == 0
    right_depth + 1
  elsif right_depth == 0
    left_depth + 1
  else
    [left_depth, right_depth].min + 1
  end
end