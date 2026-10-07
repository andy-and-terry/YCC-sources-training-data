(require (quote [clojure.string :as str]))

(defn next-row [row]
  (vec (map + (cons 0 row) (conj row 0))))

(defn pascal [n]
  (take n (iterate next-row [1])))

(doseq [row (pascal 6)]
  (println (str/join " " row)))
