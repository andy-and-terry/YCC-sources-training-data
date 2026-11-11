;; Pronic numbers n(n+1)
(defn term [n] (* n (+ n 1)))

(println (map term (range 10)))
