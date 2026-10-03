def activity_selection(activities)
  ordered = activities.sort_by { |_, finish| finish }
  selected = []
  last_end = -Float::INFINITY

  ordered.each do |start, finish|
    if start >= last_end
      selected << [start, finish]
      last_end = finish
    end
  end
  selected
end

activities = [[1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]]
puts activity_selection(activities).inspect
