(defn ms-push [stack value]
  (let [min-val (if (empty? stack) value (min value (second (peek stack))))]
    (conj stack [value min-val])))

(defn ms-pop [stack]
  (pop stack))

(defn ms-top [stack]
  (first (peek stack)))

(defn ms-min [stack]
  (second (peek stack)))

(def s1 (-> [] (ms-push 5) (ms-push 2) (ms-push 7) (ms-push 1)))

(println "min:" (ms-min s1))
(println "top:" (ms-top s1))

(def s2 (ms-pop s1))
(println "min after pop:" (ms-min s2))
