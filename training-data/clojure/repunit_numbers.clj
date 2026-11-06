;; Repunits: numbers made only of the digit 1.
(def repunits (iterate #(+ (* % 10) 1) 1))

(println (take 5 repunits))
