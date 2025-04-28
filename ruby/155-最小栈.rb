class MinStack
  def initialize
    @stack = []
    @min_stack = []
  end

  def push(val)
    @stack.push(val)
    # 维护一个最小栈，当最小栈的栈顶大于当前要入栈的元素时，将入栈元素压入最小栈的栈顶
    @min_stack.push(val) if @min_stack.empty? || @min_stack.last >= val
  end

  def pop
    val = @stack.pop
    # 当最小栈的当前元素和出栈的元素相等时，将最小栈顶的元素pop出栈
    @min_stack.pop if @min_stack.last == val
    val
  end

  def top
    @stack.last
  end

  def get_min
    @min_stack.last
  end
end
