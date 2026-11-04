(defn ordinal [n]
  (let [r100 (mod n 100)
        suffix (cond (<= 11 r100 13) "th"
                     (= 1 (mod n 10)) "st"
                     (= 2 (mod n 10)) "nd"
                     (= 3 (mod n 10)) "rd"
                     :else "th")]
    (str n suffix)))

(println (clojure.string/join " " (map ordinal [1 2 3 4 11 12 13 21 101 111])))
