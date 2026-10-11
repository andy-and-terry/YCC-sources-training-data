(def data ["1" "x" "3" "" "5"])

(defn parse-int [s]
  (try (Integer/parseInt s) (catch NumberFormatException _ nil)))

(println (keep parse-int data))
(println (keep-indexed (fn [i x] (when (even? i) x)) data))
(println (remove nil? (map parse-int data)))
