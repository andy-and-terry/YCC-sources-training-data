class Config
  def initialize = @h = {}
  def method_missing(name, *args)
    if name.to_s.end_with?("=")
      @h[name.to_s.chomp("=").to_sym] = args.first
    elsif @h.key?(name)
      @h[name]
    else
      super
    end
  end
  def respond_to_missing?(n, p = false) = true
end

c = Config.new
c.port = 8080
puts c.port
