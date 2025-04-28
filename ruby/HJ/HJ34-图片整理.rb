# link: https://www.nowcoder.com/practice/2de4127fda5e46858aa85d254af43941?tpId=37&tags=&title=&difficulty=&judgeStatus=3&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37&gioEnter=menu

# 使用内建排序的简单实现
s = gets.chomp
s = s.chars
s.sort!
puts s.join


# 不依赖内建sort排序的方法，手动实现冒泡排序
s = gets.chomp.chars
(s.length - 1).times do |i|
  (s.length - 1 - i).times do |j|
    s[j], s[j + 1] = s[j + 1], s[j] if s[j] > s[j + 1]
  end
end
puts s.join
