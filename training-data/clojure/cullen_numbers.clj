(require '[clojure.string :as str])

(defn cullen [n] (inc (* n (bit-shift-left 1 n))))

(println (str/join " " (map cullen (range 10))))
