;; Amicable pairs below 1500 via sums of proper divisors.
(defn s [n]
  (reduce + (filter #(zero? (mod n %)) (range 1 n))))

(doseq [a (range 2 1500)
        :let [b (s a)]
        :when (and (> b a) (= (s b) a))]
  (println a b))
