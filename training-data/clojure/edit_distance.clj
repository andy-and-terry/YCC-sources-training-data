(defn edit-distance [s1 s2]
  (let [m (count s1)
        n (count s2)
        dp (make-array Long/TYPE (inc m) (inc n))]
    (dotimes [i (inc m)] (aset dp i 0 i))
    (dotimes [j (inc n)] (aset dp 0 j j))
    (dotimes [i m]
      (dotimes [j n]
        (let [i+1 (inc i)
              j+1 (inc j)]
          (if (= (nth s1 i) (nth s2 j))
            (aset dp i+1 j+1 (aget dp i j))
            (aset dp i+1 j+1
                  (inc (min (aget dp i j)
                            (aget dp i j+1)
                            (aget dp i+1 j))))))))
    (aget dp m n)))

(println (edit-distance "kitten" "sitting"))
(println (edit-distance "flaw" "lawn"))
(println (edit-distance "" "abc"))
