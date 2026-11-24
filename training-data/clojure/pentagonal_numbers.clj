;; Pentagonal numbers: n(3n-1)/2.
(println (clojure.string/join " " (map #(quot (* % (dec (* 3 %))) 2) (range 1 11))))
