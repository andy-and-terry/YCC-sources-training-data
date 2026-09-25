PREC = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3 }.freeze

def to_rpn(tokens)
  out = []
  ops = []
  tokens.each do |t|
    if PREC.key?(t)
      while (top = ops.last) && PREC.key?(top) && (PREC[top] > PREC[t] || (PREC[top] == PREC[t] && t != '^'))
        out << ops.pop
      end
      ops << t
    elsif t == '('
      ops << t
    elsif t == ')'
      out << ops.pop until ops.last == '('
      ops.pop
    else
      out << t
    end
  end
  out + ops.reverse
end

def eval_rpn(rpn)
  rpn.each_with_object([]) do |t, st|
    if PREC.key?(t)
      b = st.pop
      a = st.pop
      st << a.public_send(t == '^' ? :** : t.to_sym, b)
    else
      st << t.to_f
    end
  end.first
end

rpn = to_rpn('3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3'.split)
puts "#{rpn.join(' ')} = #{eval_rpn(rpn)}"
