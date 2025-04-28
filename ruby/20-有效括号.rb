

def is_valid(s)
  s = s.split('')
  stack = []
  openings = ['(', '[', '{']
  closings = [')', ']', '}']

  until s.empty?
    c = s.shift
    if openings.include? c
      stack.unshift c
    elsif closings.include? c
      return false unless closings.index(c) == openings.index(stack.first)

      stack.shift
    end
  end

  stack.empty?
end
