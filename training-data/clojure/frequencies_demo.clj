(require '[clojure.string :as str])

(def text "the quick brown fox jumps over the lazy dog the end")

(def freqs (frequencies (str/split text #"\s+")))

(println freqs)
(println (get freqs "the"))
(println (take 3 (sort-by val > freqs)))
(println (frequencies "mississippi"))
(println (apply max-key val (frequencies [1 2 2 3 3 3])))
