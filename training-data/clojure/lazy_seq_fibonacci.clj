(defn fibs
  ([] (fibs 0N 1N))
  ([a b] (lazy-seq (cons a (fibs b (+ a b))))))
(println (take 12 (fibs)))
