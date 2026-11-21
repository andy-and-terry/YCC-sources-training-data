;; Cantor pairing function and its inverse.
(defn pair [x y]
  (+ (quot (* (+ x y) (+ x y 1)) 2) y))

(defn unpair [z]
  (let [w (quot (dec (long (Math/sqrt (inc (* 8 z))))) 2)
        y (- z (quot (* w (inc w)) 2))]
    [(- w y) y]))

(println (pair 3 4))
(println (clojure.string/join " " (unpair 32)))
