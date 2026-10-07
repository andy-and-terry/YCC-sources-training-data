(defn word-break? [s dict]
  (let [n (count s)
        dict-set (set dict)
        dp (boolean-array (inc n))]
    (aset dp 0 true)
    (doseq [i (range 1 (inc n))]
      (doseq [j (range i)]
        (when (and (aget dp j) (not (aget dp i)))
          (when (contains? dict-set (subs s j i))
            (aset dp i true)))))
    (aget dp n)))

(def dict #{"leet" "code" "sand" "and" "cat" "cats" "dog"})

(println (word-break? "leetcode" dict))
(println (word-break? "sandog" dict))
(println (word-break? "catsdog" dict))
(println (word-break? "catsflag" dict))
