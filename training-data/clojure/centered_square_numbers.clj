;; Centered square numbers 2n(n+1)+1
(defn term [n] (+ (* (* 2 n) (+ n 1)) 1))

(println (map term (range 10)))
