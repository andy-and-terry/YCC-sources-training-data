(defn merge-lists [a b]
  (cond
    (empty? a) b
    (empty? b) a
    (<= (first a) (first b)) (cons (first a) (merge-lists (rest a) b))
    :else (cons (first b) (merge-lists a (rest b)))))

(defn merge-sort [items]
  (if (<= (count items) 1)
    items
    (let [mid (quot (count items) 2)
          [left right] (split-at mid items)]
      (merge-lists (merge-sort left) (merge-sort right)))))

(println (merge-sort [5 2 9 1 5 6]))
