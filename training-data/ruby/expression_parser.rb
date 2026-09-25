# Recursive-descent parser producing a nested-array AST that is then evaluated.
class ExprParser
  def self.parse(src) = new(src).parse

  def initialize(src)
    @tokens = src.scan(/\d+(?:\.\d+)?|[a-z]\w*|[-+*\/^()]/i)
    @pos = 0
  end

  def parse
    ast = expr
    raise ArgumentError, "trailing token #{peek.inspect}" if peek

    ast
  end

  private

  def peek = @tokens[@pos]

  def take
    tok = @tokens[@pos]
    @pos += 1
    tok
  end

  def expr
    node = term
    node = [take.to_sym, node, term] while %w[+ -].include?(peek)
    node
  end

  def term
    node = power
    node = [take.to_sym, node, power] while %w[* /].include?(peek)
    node
  end

  def power
    base = unary
    return base unless peek == '^'

    take
    [:**, base, power]
  end

  def unary
    return primary unless peek == '-'

    take
    [:-@, unary]
  end

  def primary
    tok = take
    case tok
    when '('
      node = expr
      raise ArgumentError, 'expected )' unless take == ')'

      node
    when /\A\d/ then tok.to_f
    when /\A[a-z]/i then tok.to_sym
    else raise ArgumentError, "unexpected #{tok.inspect}"
    end
  end
end

def evaluate(node, env)
  case node
  when Numeric then node
  when Symbol then env.fetch(node)
  when Array
    op, *args = node
    vals = args.map { |a| evaluate(a, env) }
    vals.first.public_send(op, *vals.drop(1))
  end
end

env = { x: 2.0, y: 4.0 }
['1 + 2 * 3', '2 ^ 3 ^ 2', '-(x + 3) * y', '(1 + 2', 'x / 0.5'].each do |src|
  ast = ExprParser.parse(src)
  puts "#{src.ljust(14)} = #{evaluate(ast, env)}   #{ast.inspect}"
rescue ArgumentError => e
  puts "#{src.ljust(14)} error: #{e.message}"
end
