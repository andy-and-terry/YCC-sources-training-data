;; Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
(println (clojure.string/join " " (take 8 (iterate #(inc (* % 10)) 1))))
