;; Centered square numbers: n^2 + (n+1)^2.
(println (clojure.string/join " " (map #(+ (* % %) (* (inc %) (inc %))) (range 10))))
