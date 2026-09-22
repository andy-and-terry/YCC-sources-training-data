(defn word-break? [s word-dict]
  (let [word-set (set word-dict)
        n (count s)
        dp (atom (vec (repeat (inc n) false)))]
    (swap! dp assoc 0 true)
    (doseq [i (range 1 (inc n))]
      (doseq [j (range i)]
        (when (and (@dp j) (not (@dp i)) (contains? word-set (subs s j i)))
          (swap! dp assoc i true))))
    (@dp n)))

(println (word-break? "leetcode" ["leet" "code"]))
(println (word-break? "catsandog" ["cats" "dog" "sand" "and" "cat"]))
