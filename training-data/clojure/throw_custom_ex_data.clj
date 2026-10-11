(defn validate-age [age]
  (when-not (<= 0 age 150)
    (throw (ex-info "invalid age" {:age age :allowed [0 150]})))
  age)

(println (validate-age 30))
(try
  (validate-age 200)
  (catch clojure.lang.ExceptionInfo e
    (println (ex-message e) (ex-data e))))
