sorted = [1, 3, 5, 7, 9, 11]

p sorted.bsearch { |x| x >= 6 }        # 7 (find-minimum mode)
p sorted.bsearch_index { |x| x >= 6 }  # 3
p sorted.bsearch { |x| 5 <=> x }       # 5 (find-any mode)
p sorted.bsearch { |x| x >= 100 }      # nil

# Search the answer space: smallest n with n*n >= 1000
p (0..1000).bsearch { |n| n * n >= 1000 }

# Float bisection for sqrt(2)
p (0.0..2.0).bsearch { |x| x * x >= 2 }.round(6)
