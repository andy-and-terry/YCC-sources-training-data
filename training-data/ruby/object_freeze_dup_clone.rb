class Config
  attr_reader :name, :options

  def initialize(name, options)
    @name = name
    @options = options
  end
end

original = Config.new("app", { debug: true })
original.freeze
puts original.frozen?

begin
  original.instance_variable_set(:@name, "other")
rescue FrozenError => e
  puts "FrozenError: #{e.message[0, 30]}"
end

shallow = original.dup
puts shallow.frozen?

clone = original.clone
puts clone.frozen?
puts original.clone(freeze: false).frozen?

# freeze is shallow: nested hash is still mutable
original.options[:debug] = false
puts original.options.inspect

deep = Marshal.load(Marshal.dump(original.options))
deep[:debug] = :changed
puts original.options.inspect, deep.inspect
