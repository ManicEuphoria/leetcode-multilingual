x, y = 0, 0

# commands = gets.chomp
line = "A10;S20;W10;D30;X;A1A;B10A11;;A10;"

head, tail = 0, 0
pt = ''
commands = []
# 定义方向映射
directions = {
  "A" => [-1, 0],  # 左移
  "D" => [1, 0],   # 右移
  "S" => [0, -1],  # 下移
  "W" => [0, 1]    # 上移
}

while tail < line.size
  if line[tail] == ';'
    cmd = line[head..tail-1]
    if !!cmd.match(/^[ASDW]([1-9]|[1-9][0-9])$/)
      d = cmd[0]
      step = cmd[1..-1].to_i
      dx, dy = directions[d]
      x += dx * step
      y += dy * step
    end
    head = tail + 1
  end
  tail += 1
end

puts [x, y].join(',')
