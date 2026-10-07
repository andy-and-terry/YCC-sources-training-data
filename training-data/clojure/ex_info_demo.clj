(defn validate-age [age]
  (if (neg? age)
    (throw (ex-info "age cannot be negative" {:type ::invalid-age :value age}))
    age))

(defn safe-validate [age]
  (try
    (validate-age age)
    (catch clojure.lang.ExceptionInfo e
      (println "caught:" (.getMessage e) "data:" (ex-data e))
      nil)))

(println (safe-validate 25))
(println (safe-validate -5))
