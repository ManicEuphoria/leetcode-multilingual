# n = gets.to_i  # 读取矩阵大小
n = 3

n.times do |i|
  row = []
  current_i = i + 1 # 转换为1-based的行号
  max_j = n - i # 当前行最多填充的列数

  (1..max_j).each do |j|
    # 计算数值公式：(i+j-2)(i+j-1)/2 + j
    sum = current_i + j - 2 # 计算(i+j-2)
    value = (sum * (sum + 1)) / 2 + j # 套用公式计算值, n*(n+1)/2是一个歉n项和的公式
    row << value.to_s # 将数值转为字符串存入行数组
  end

  puts row.join(' ') # 输出当前行，元素用空格分隔
end
