#links: https://www.nowcoder.com/practice/de538edd6f7e4bc3a5689723a7435682?tpId=37&rp=1&sourceUrl=%2Fexam%2Foj%2Fta%3FtpId%3D37&difficulty=&judgeStatus=3&tags=&title=&gioEnter=menu&dayCountBigMember=365%E5%A4%A9

def valid_subnet_mask?(ip)
  parts = ip.split('.')
  return false unless parts.size == 4 && parts.all? { |part| part.match(/^\d+$/) && part.to_i.between?(0, 255) }

  bin_parts = parts.map { |part| format('%08b', part.to_i) }
  bin_str = bin_parts.join

  # 对于全0掩码无效
  return false if bin_str == '0' * 32 || bin_str == '1' * 32
  
  # 根据题目要求，255.255.255.255被视为有效掩码

  
  # 掩码必须是连续的1后面跟着连续的0
  ones = bin_str.index('0') || 32
  zeros = bin_str.length - ones
  
  # 检查1后面是否都是0
  return false if bin_str[ones, zeros] != '0' * zeros

  true
end

def valid_ip?(ip)
  parts = ip.split('.')
  return false unless parts.size == 4

  return false unless parts.all? { |part| part.match(/^\d+$/) && part.to_i.between?(0, 255) }

  i = parts.first.to_i
  return false if i == 0 || i == 127

  true
end


def is_private_ip?(ip)
  parts = ip.split('.').map(&:to_i)
  
  # 10.0.0.0 - 10.255.255.255
  return true if parts[0] == 10
  
  # 172.16.0.0 - 172.31.255.255
  return true if parts[0] == 172 && parts[1].between?(16, 31)
  
  # 192.168.0.0 - 192.168.255.255
  return true if parts[0] == 192 && parts[1] == 168
  
  false
end

def count_categorized_ip(ip, result)
  i = ip.split('.').first.to_i

  if i.between?(1, 126)
    result[0] += 1
  elsif i.between?(128, 191)
    result[1] += 1
  elsif i.between?(192, 223)
    result[2] += 1
  elsif i.between?(224, 239)
    result[3] += 1
  elsif i.between?(240, 255)
    result[4] += 1
  end

  result[6] += 1 if is_private_ip? ip
end

result = [0, 0, 0, 0, 0, 0, 0]

while line = gets&.chomp
  break if line.nil?

  ip, mask = line.split('~')
  if !valid_ip?(ip) || !valid_subnet_mask?(mask)
    result[5] += 1
  else
    count_categorized_ip(ip, result)
  end
end

puts result.join(' ')
