# link: https://www.nowcoder.com/practice/1221ec77125d4370833fd3ad5ba72395?tpId=37&tags=&title=&difficulty=&judgeStatus=3&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37&gioEnter=menu
# 题目描述：有一种兔子，从出生后第三个月起，每个月都会生一只兔子，生出来的兔子同理。假设兔子都不死，求解第n个月时兔子总数


def cnt_rabbits(month)
  cur  = 1 # 这个月的兔子数量
  prev = 0 # 前个月的兔子数量

  1.upto(month).each do |m|
    if m <= 2
      next if m == 1 # 第一个月的状态已经在函数开头定义，所以需要跳过，否则会变成m=1，prev=cur=1

      prev = cur # 前两个月不生育，当月份来到第二个月时，prev(第一个月)有1只，当前月份数量不变
    else
      # 这里理解起来比较绕，为什么这样写可以达到后续生的兔子第三个月又生兔子，然后总数加起来是正确的？
      # 为什么要使用并行赋值，而不是顺序赋值？顺序赋值为：prev = cur; cur = prev + cur
      # 如果使用顺序赋值，会污染数据计算的顺序，比如当前是第三月，上月prev有1只兔子，本月可以生新兔子，因此cur为2
      # 此时如果顺序赋值计算，则变成了prev=2,cur=prev+cur -> 4,
      prev, cur = cur, cur + prev
    end
  end
  cur
end

puts cnt_rabbits(4) # 正确输出 5
