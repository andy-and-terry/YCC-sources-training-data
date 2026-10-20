(defn risky [n]
  (cond (neg? n) (throw (ex-info "negative" {:n n :type :neg}))
        (zero? n) (throw (ArithmeticException. "zero"))
        :else (/ 10 n)))
(doseq [n [5 -1 0]]
  (try (println (risky n))
       (catch clojure.lang.ExceptionInfo e (println "info" (ex-message e) (ex-data e)))
       (catch ArithmeticException e (println "arith" (.getMessage e)))
       (finally (println "done" n))))
(println (try (Integer/parseInt "x") (catch NumberFormatException _ -1)))
(println (try (assert (pos? -1) "must be positive") (catch AssertionError e (.getMessage e))))
