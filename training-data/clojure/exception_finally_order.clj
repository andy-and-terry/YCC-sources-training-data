(defn risky [n]
  (try
    (println "start" n)
    (/ 10 n)
    (catch ArithmeticException e
      (println "caught:" (.getMessage e))
      :error)
    (finally
      (println "finally" n))))

(println (risky 2))
(println (risky 0))
