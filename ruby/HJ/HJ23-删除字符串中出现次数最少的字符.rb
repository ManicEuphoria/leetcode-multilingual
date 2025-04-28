#link: https://www.nowcoder.com/practice/05182d328eb848dda7fdd5e029a56da9?tpId=37&tags=&title=&difficulty=0&judgeStatus=3&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37

line = gets.chomp
counter = Hash.new { |k, v| k[v] = 0 }
line.each_char { |c| counter[c] += 1 }

min_value = counter.values.min
counter.select { |k, v| v == min_value }.keys.each do |k|
  line.delete!(k)
end

puts line
