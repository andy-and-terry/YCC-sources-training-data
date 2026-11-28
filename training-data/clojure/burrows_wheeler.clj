(defn bwt [s]
  (let [n (count s)
        rots (for [i (range n)] (str (subs s i) (subs s 0 i)))]
    (apply str (map last (sort rots)))))

(println (bwt "banana$"))
