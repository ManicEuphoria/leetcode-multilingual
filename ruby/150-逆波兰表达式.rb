# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  opts  = ['+', '-', '*', '/']

  tokens.each do |t|
    if opts.include?(t)
      b = stack.pop
      a = stack.pop
      res = t == '/' ? (a / b.to_f).to_i : [a, b].reduce(t.to_sym)
      stack << res
    else
      stack << t.to_i
    end
  end
  stack.first
end
