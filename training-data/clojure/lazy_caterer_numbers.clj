;; Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
(println (clojure.string/join " " (map (fn [n] (inc (quot (* n (inc n)) 2))) (range 10))))
