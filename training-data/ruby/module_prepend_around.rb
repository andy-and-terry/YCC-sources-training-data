module Logging
  def run(*args)
    puts "before"
    r = super
    puts "after #{r}"
    r
  end
end

class Job
  prepend Logging
  def run(x) = x * 2
end

Job.new.run(21)
puts Job.ancestors.first(2).inspect
