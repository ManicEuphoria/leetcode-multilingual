class OptimizedQueue
  def initialize
    @input = []  # 入队栈
    @output = [] # 出队栈
  end

  def enqueue(element)
    @input.push(element)
    p @input
  end

  def dequeue
    if @output.empty?
      # 翻转输入栈到输出栈（逆序关键步骤）
      @output = @input.reverse
      @input.clear
    end
    @output.pop # 取出最早的元素
    p "output: #{@output.size}"
  end
end


queue = OptimizedQueue.new

producer = Thread.new do
  1000.times do |i|
    queue.enqueue(i)
    Thread.pass if i % 100 == 0 # 每100次让出GIL
  end
end

consumer = Thread.new do
  1000.times do |j|
    queue.dequeue
    Thread.pass if j % 50 == 0
  end
end

producer.join
consumer.join

puts queue.dequeue # 应输出nil（无数据残留）