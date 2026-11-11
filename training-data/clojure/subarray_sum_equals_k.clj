;; Count contiguous subarrays whose sum equals k (prefix sums + map).
(defn count-subarrays [nums k]
  (loop [[x & more] nums, total 0, seen {0 1}, cnt 0]
    (if (nil? x)
      cnt
      (let [t (+ total x)]
        (recur more t (update seen t (fnil inc 0)) (+ cnt (get seen (- t k) 0)))))))

(println (count-subarrays [1 1 1] 2))
