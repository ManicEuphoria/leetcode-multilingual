# HJ6 质数因子
# 描述
# 输入一个整数，按照从小到大的顺序输出它的所有质数的因子，以空格分隔。

# 输入描述：
# 输入一个整数

# 输出描述：
# 按照从小到大的顺序输出它的所有质数的因子，以空格分隔。

# 示例1
# 输入：
# 180
# 输出：
# 2 2 3 3 5

# n = gets.chomp.to_i
n = 199303160512

factors = []
i = 2
count = 0
while i <= n
    if n % i == 0
        factors << i
        n /= i
    else
        i += 1
    end
    count += 1
end
p count
puts factors.join(' ')


# n = 199303160512

factors = []
i = 2
count = 0
while i ** 2 <= n
  
    while n % i == 0
        factors << i
        n /= i
    end
    i += 1
    count += 1
end

factors << n if n > 1
p count
puts factors.join(' ')

