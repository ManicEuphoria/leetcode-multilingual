# line = gets.chomp
s = '$bo*y gi!r#l'
# s = "Nowcoder Hello"

res = []
cnt = 0
pt = 0
loop do
  if s[pt] =~ /[A-Za-z]/
    cnt += 1
  else
    res.unshift s[pt - cnt..pt - 1] if cnt.positive?
    cnt = 0
  end
  pt += 1
  break if pt == s.size
end

res.unshift s[pt - cnt..pt - 1] if cnt.positive?
p res.join(' ')
