class HTML
  def initialize = @out = []
  def method_missing(tag, text = nil, &blk)
    return super unless text || blk
    @out << "<#{tag}>"
    text ? @out << text : instance_eval(&blk)
    @out << "</#{tag}>"
    self
  end
  def respond_to_missing?(*) = false
  def to_s = @out.join
end

puts HTML.new.ul { li "a"; li "b" }
