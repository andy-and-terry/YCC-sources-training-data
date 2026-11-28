(require '[clojure.set :as set])

(defn jaccard [a b]
  (let [a (set a) b (set b) u (count (set/union a b))]
    (if (zero? u) 1 (/ (count (set/intersection a b)) u))))

(println (jaccard [1 2 3 4] [3 4 5]))
