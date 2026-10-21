;; Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1 (*' and -' promote to BigInt instead of overflowing)
(def sylvester
  (iterate (fn [s] (+' (-' (*' s s) s) 1)) 2))

(doseq [[i s] (map-indexed vector (take 8 sylvester))]
  (println (str "s(" i ") = " s)))
