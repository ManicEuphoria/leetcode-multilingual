# 题目链接： https://www.nowcoder.com/practice/f9c6f980eeec43ef85be20755ddbeaf4?tpId=37&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37&difficulty=&judgeStatus=3&tags=&title=&gioEnter=menu&dayCountBigMember=365%E5%A4%A9

# 读取预算和物品总数，n是总预算，m是物品总数
n, m = gets.split.map(&:to_i)

# 创建主件哈希表，结构为 {主件ID => {主件信息，附件列表}}
# 使用Hash.new的初始化方式确保访问不存在的键时自动创建结构
main_items = Hash.new { |h, k| h[k] = { main: nil, accessories: [] } }

# 遍历每个物品（共m个）
m.times do |i|
  # 读取物品的价格v、重要度w、主件编号q
  v, w, q = gets.split.map(&:to_i)
  # 生成物品编号（输入顺序从1开始）
  item_id = i + 1
  
  if q == 0
    # 如果是主件：存入主件位置（覆盖附件可能产生的空值）
    main_items[item_id][:main] = { v: v, w: w }
  else
    # 如果是附件：添加到对应主件的附件列表中
    main_items[q][:accessories] << { v: v, w: w }
  end
end

# 生成所有主件的有效组合
groups = []
main_items.each do |id, data|
  main = data[:main]
  next unless main # 跳过没有主件的情况（理论上不会出现）

  accessories = data[:accessories]
  combinations = []
  
  # 基础组合：只买主件
  main_v = main[:v]       # 主件价格
  main_s = main[:v] * main[:w] # 主件满意度
  combinations << [main_v, main_s]

  # 处理第一个附件（如果有）
  if accessories.size >= 1
    a1 = accessories[0]
    v1 = a1[:v]
    s1 = a1[:v] * a1[:w]
    # 组合：主件+附件1
    combinations << [main_v + v1, main_s + s1]

    # 处理第二个附件（如果有）
    if accessories.size >= 2
      a2 = accessories[1]
      v2 = a2[:v]
      s2 = a2[:v] * a2[:w]
      # 组合：主件+附件2
      combinations << [main_v + v2, main_s + s2]
      # 组合：主件+附件1+附件2
      combinations << [main_v + v1 + v2, main_s + s1 + s2]
    end
  end

  # 将当前主件的所有有效组合加入总列表
  groups << combinations
end

# 初始化动态规划数组：dp[j]表示预算为j时的最大满意度
dp = Array.new(n + 1, 0)

# 分组背包处理逻辑
groups.each do |combinations|
  # 复制当前状态，确保每组物品只选择一种组合
  prev_dp = dp.dup
  
  combinations.each do |v, s|
    next if v > n # 跳过超过预算的组合
    
    # 逆序遍历预算（避免重复选择同一组的多个组合）
    # 从n downto v的逆序处理保证每个物品组只被选择一次
    (v..n).to_a.reverse.each do |j|
      # 状态转移方程：比较不选当前组合和选择当前组合的满意度
      if prev_dp[j - v] + s > dp[j]
        dp[j] = prev_dp[j - v] + s
      end
    end
  end
end

# 输出所有预算可能性中的最大满意度
puts dp.max