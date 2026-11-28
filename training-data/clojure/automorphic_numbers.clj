(require '[clojure.string :as str])

(defn automorphic? [n]
  (str/ends-with? (str (* n n)) (str n)))

(println (filter automorphic? (range 0 1000))) ; (0 1 5 6 25 76 376 625)
