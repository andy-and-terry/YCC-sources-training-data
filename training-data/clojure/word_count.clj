(defn word-count [text]
  (->> (clojure.string/split (clojure.string/lower-case text) #"\s+")
       (frequencies)
       (sort-by val >)))

(println (take 3 (word-count "the quick brown fox jumps over the lazy dog the fox runs")))
