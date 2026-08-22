(defn quicksort [items]
  (if (<= (count items) 1)
    items
    (let [pivot (first items)
          rest-items (rest items)
          smaller (filter #(< % pivot) rest-items)
          larger (filter #(>= % pivot) rest-items)]
      (concat (quicksort smaller) [pivot] (quicksort larger)))))

(println (quicksort [5 3 8 1 9 2]))
