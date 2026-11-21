;; Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
(defn digits [n] (mapv #(Character/digit ^char % 10) (str n)))

(defn keith? [n]
  (let [seed (digits n)
        k (count seed)]
    (loop [seq' seed]
      (let [l (peek seq')]
        (if (>= l n)
          (= l n)
          (recur (conj seq' (reduce + (take-last k seq')))))))))

(println (clojure.string/join " " (filter keith? (range 10 1200))))
