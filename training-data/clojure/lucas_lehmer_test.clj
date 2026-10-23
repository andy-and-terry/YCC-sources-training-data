(require '[clojure.string :as str])

(defn mersenne-prime-exponent? [p]
  (or (= p 2)
      (let [m (dec (bit-shift-left 1 p))
            step (fn [s] (mod (- (* s s) 2) m))]
        (zero? (nth (iterate step 4) (- p 2))))))

(println (str/join " " (filter mersenne-prime-exponent? [2 3 5 7 11 13 17 19])))
