(require '[clojure.string :as str])

(defn woodall [n] (dec (* n (bit-shift-left 1 n))))

(println (str/join " " (map woodall (range 1 11))))
