(defn interleave-all [& strs]
  (->> (apply map vector (map #(concat % (repeat nil)) strs)) ; pad each with nils
       (take (apply max (map count strs)))
       (apply concat)
       (remove nil?)
       (apply str)))

(println (interleave-all "abc" "12345"))
(println (interleave-all "ab" "cd" "efg"))
