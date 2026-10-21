;; Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
(def jacobsthal
  (map first (iterate (fn [[a b]] [b (+ b (* 2 a))]) [0 1])))

(println (clojure.string/join " " (take 15 jacobsthal)))
