# link: https://www.nowcoder.com/practice/fe298c55694f4ed39e256170ff2c205f?tpId=37&tags=&title=&difficulty=0&judgeStatus=3&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37

while (n = gets.to_i)
  break if n.to_i.zero?

  n = n.to_i
  can_drink = 0

  while n > 1 # n小于等于1时，代表要凑齐3个，得借2个，3空瓶换一瓶汽水，还剩1个空瓶，无法偿还2个借来的空瓶
    can_drink += n / 3 # 除法向下取整得到能喝多少瓶
    n = n / 3 + n % 3 # 喝了can_drink, 又有了can_drink个空瓶。同时，上一步如果除法还有余数，则是没能兑换还留在手上的。
    if n == 2 # 当n一直变小到2时，需要借1个空瓶，凑满3个来换一瓶汽水。喝完后手上还剩1个空瓶，偿还后，手上瓶子为0.
      can_drink += 1
      break
    end
  end
  puts can_drink
  next
end
