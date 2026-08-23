(defn word-frequency [text]
  (->> (clojure.string/split (clojure.string/lower-case text) #"\s+")
       (frequencies)
       (sort-by val >)))

(println (word-frequency "the quick brown fox jumps over the lazy dog the fox runs"))
