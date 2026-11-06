;; Amicable pairs: d(a) = b and d(b) = a with a != b.
(defn d [n]
  (reduce + (filter #(zero? (mod n %)) (range 1 n))))

(doseq [a (range 2 1500)
        :let [b (d a)]
        :when (and (> b a) (= (d b) a))]
  (println a b))
