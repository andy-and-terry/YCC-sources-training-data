(defn safe-sqrt [x]
  {:pre [(number? x) (>= x 0)]
   :post [(>= % 0)]}
  (Math/sqrt x))

(println (safe-sqrt 16))
(println (try (safe-sqrt -4)
              (catch AssertionError e :rejected)))
