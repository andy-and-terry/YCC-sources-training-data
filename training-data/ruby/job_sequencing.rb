Job = Struct.new(:id, :deadline, :profit)

def schedule(jobs)
  slots = Array.new(jobs.map(&:deadline).max + 1)
  jobs.sort_by { |j| -j.profit }.each do |job|
    free = job.deadline.downto(1).find { |t| slots[t].nil? }
    slots[free] = job if free
  end
  chosen = slots.compact
  [chosen.map(&:id), chosen.sum(&:profit)]
end

jobs = [Job.new(:a, 2, 100), Job.new(:b, 1, 19), Job.new(:c, 2, 27), Job.new(:d, 1, 25), Job.new(:e, 3, 15)]
p schedule(jobs)
