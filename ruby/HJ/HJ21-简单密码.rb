line = gets.chomp
s = ''

line.each_char do |c|
  o = c.ord
  if o.between?(97, 99)
    s += '2'
  elsif o.between?(100, 102)
    s += '3'
  elsif o.between?(103, 105)
    s += '4'
  elsif o.between?(106, 108)
    s += '5'
  elsif o.between?(109, 111)
    s += '6'
  elsif o.between?(112, 115)
    s += '7'
  elsif o.between?(116, 118)
    s += '8'
  elsif o.between?(119, 122)
    s += '9'
  elsif o.between?(65, 90)
    diff = c == 'Z' ? 7 : 33
    s += (o + diff).chr
  elsif o.between?(48, 57)
    s += c
  end
end
puts s