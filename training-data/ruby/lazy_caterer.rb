pieces = ->(cuts) { (cuts * cuts + cuts + 2) / 2 }
puts (0...10).map(&pieces).join(" ") # 1 2 4 7 11 16 22 29 37 46
