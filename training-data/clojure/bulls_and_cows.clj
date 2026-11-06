;; Bulls and Cows scoring for equal-length digit strings.
(defn score [secret guess]
  (let [pairs (map vector secret guess)
        bulls (count (filter (fn [[s g]] (= s g)) pairs))
        rest  (remove (fn [[s g]] (= s g)) pairs)
        sc    (frequencies (map first rest))
        gc    (frequencies (map second rest))
        cows  (reduce + (for [[c n] sc] (min n (get gc c 0))))]
    [bulls cows]))

(let [[b c] (score "1807" "7810")]
  (println (str b " bull(s), " c " cow(s)")))
