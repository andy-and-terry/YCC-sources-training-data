;; Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
(defn bouncy? [n]
  (let [d (vec (str n))]
    (and (not= d (vec (sort d)))
         (not= d (vec (sort (comp - compare) d))))))

(println (count (filter bouncy? (range 1 1000))))
