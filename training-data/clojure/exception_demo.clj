(defn safe-divide [a b]
  (try
    (/ a b)
    (catch ArithmeticException e
      (str "error: " (.getMessage e)))))

(println (safe-divide 10 2))
(println (safe-divide 5 0))
