;; Lazy caterer sequence: max pieces from n cuts
(defn term [n] (+ (quot (* n (+ n 1)) 2) 1))

(println (map term (range 10)))
