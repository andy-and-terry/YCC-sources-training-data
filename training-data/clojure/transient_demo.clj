(defn build-vector-persistent [n]
  (loop [i 0 v []]
    (if (= i n)
      v
      (recur (inc i) (conj v i)))))

(defn build-vector-transient [n]
  (loop [i 0 v (transient [])]
    (if (= i n)
      (persistent! v)
      (recur (inc i) (conj! v i)))))

(def a (build-vector-persistent 10))
(def b (build-vector-transient 10))

(println a)
(println b)
(println (= a b))
