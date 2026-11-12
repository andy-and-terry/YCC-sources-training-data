class Tracked
  def self.tracked(*names)
    names.each do |n|
      define_method("#{n}_history") { (@h ||= Hash.new { |h, k| h[k] = [] })[n] }
      define_method(n) { instance_variable_get("@#{n}") }
      define_method("#{n}=") do |v|
        send("#{n}_history") << v
        instance_variable_set("@#{n}", v)
      end
    end
  end
  tracked :status
end
t = Tracked.new
t.status = :a; t.status = :b
p t.status_history
