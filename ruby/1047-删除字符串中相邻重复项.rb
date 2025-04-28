# @param {String} s
# @return {String}
def remove_duplicates(s)
  stack = []
  s.each_char do |c|
    stack.last == c ? stack.pop : stack << c
  end

  stack.join
end
