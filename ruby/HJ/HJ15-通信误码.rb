a = 7
b = [1,2, 2 ,4, 2, 1, 1]

most_freq_cnts = Hash.new(0)

b.each do |i|
  most_freq_cnts[i] += 1
end

max_freq = most_freq_cnts.values.max
max_freq_codes = most_freq_cnts.select {|_, v| v == max_freq}
codes = max_freq_codes.keys

res = []
unless codes.empty?
  c = codes.pop
  left, right = b.index(c), b.size - b.reverse.index(c)
  res << right - left
end
p res.min
