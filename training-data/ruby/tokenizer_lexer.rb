require 'strscan'

Token = Struct.new(:kind, :text, :line)
KEYWORDS = %w[def if else elsif end while return].freeze
RULES = [
  [:number, /\d+(?:\.\d+)?/],
  [:string, /"(?:[^"\\]|\\.)*"/],
  [:ident, /[A-Za-z_]\w*[?!]?/],
  [:op, /==|!=|<=|>=|&&|\|\||[-+*\/=<>(){},;.]/]
].freeze

def tokenize(src)
  ss = StringScanner.new(src)
  line = 1
  tokens = []
  until ss.eos?
    if (nl = ss.scan(/\n/))
      line += nl.size
    elsif ss.scan(/[ \t]+|#[^\n]*/)
      next
    else
      kind, = RULES.find { |_, re| ss.scan(re) }
      raise SyntaxError, "unexpected #{ss.peek(1).inspect} on line #{line}" unless kind

      kind = :keyword if kind == :ident && KEYWORDS.include?(ss.matched)
      tokens << Token.new(kind, ss.matched, line)
    end
  end
  tokens
end

code = "x = 3.5 * (y + 2) # note\nif x >= 10 && ok?\n  puts(\"big\")\nend"
tokenize(code).each { |t| puts "#{t.line} #{t.kind.to_s.ljust(8)} #{t.text}" }
begin
  tokenize('a @ b')
rescue SyntaxError => e
  puts "error: #{e.message}"
end
