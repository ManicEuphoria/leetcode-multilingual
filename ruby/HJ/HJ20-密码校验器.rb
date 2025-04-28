NG = 'NG'.freeze
OK = 'OK'.freeze

while line = gets&.chomp
  break if line.nil?

  sub_strs = []
  head, step = 0, 3
  while head < line.size - 3
    sub_strs << line[head, step]
    head += 1
  end

  diversity_counter = [0, 0, 0, 0]
  line.each_char do |c|
    o = c.ord
    diversity_counter[0] += 1 if o.between?(65, 90) # 大写字母
    diversity_counter[1] += 1 if o.between?(97, 122) # 大写字母
    diversity_counter[2] += 1 if o.between?(48, 57) # 大写字母
    diversity_counter[-1] += 1 if o.between?(33, 47) || o.between?(58, 64) || o.between?(91, 96) || o.between?(123, 126) # 特殊字符
  end

  if diversity_counter.count(0) >= 2 || line.size < 8 || (sub_strs.size - sub_strs.uniq.size).positive?
    puts NG
  else
    puts OK
  end
end
