;; Hexagonal numbers: n(2n-1).
(println (clojure.string/join " " (map #(* % (dec (* 2 %))) (range 1 11))))
