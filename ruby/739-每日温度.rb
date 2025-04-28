# 输入参数是一个整数数组,表示每天的温度
# @param {Integer[]} temperatures
# @return {Integer[]} 返回一个整数数组,表示每天需要等待的天数
def daily_temperatures(temperatures)
  # 获取温度数组的长度,用于初始化结果数组
  n = temperatures.size

  # 初始化结果数组,默认值为0
  # 0表示之后没有更高的温度,如果找到更高温度会被更新为等待天数
  ans = Array.new(n, 0)

  # 初始化一个栈用于存储温度的下标
  # 栈中存储的是尚未找到下一个更高温度的日期下标
  # 栈内元素保持单调递减,即栈底到栈顶对应的温度依次递减
  stack = []

  # 遍历每一天的温度
  n.times do |i|
    # 当栈不为空,且当前温度大于栈顶温度时
    # 说明找到了栈顶元素对应日期的下一个更高温度
    while !stack.empty? && temperatures[i] > temperatures[stack.last]
      # 弹出栈顶元素(较低温度的日期下标)
      j = stack.pop
      # 计算等待天数 = 当前日期 - 较低温度的日期
      ans[j] = i - j
    end

    # 将当前日期入栈
    # 等待之后遍历到更高温度时进行处理
    stack << i
  end

  # 返回结果数组
  # 此时栈中可能还有元素,说明这些日期之后都没有出现更高的温度
  # 对应结果数组中的值就保持为0
  ans
end
