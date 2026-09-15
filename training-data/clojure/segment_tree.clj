(def n 8)
(def tree (long-array (* 2 n)))

(defn build! [arr]
  (dotimes [i n] (aset tree (+ n i) (long (arr i))))
  (loop [i (dec n)]
    (when (pos? i)
      (aset tree i (+ (aget tree (* 2 i)) (aget tree (inc (* 2 i)))))
      (recur (dec i)))))

(defn update! [pos value]
  (aset tree (+ pos n) (long value))
  (loop [p (quot (+ pos n) 2)]
    (when (>= p 1)
      (aset tree p (+ (aget tree (* 2 p)) (aget tree (inc (* 2 p)))))
      (recur (quot p 2)))))

(defn query [l r]
  (loop [l (+ l n) r (+ r n 1) sum 0]
    (if (< l r)
      (let [sum (if (odd? l) (+ sum (aget tree l)) sum)
            l (if (odd? l) (inc l) l)
            sum (if (odd? r) (+ sum (aget tree (dec r))) sum)
            r (if (odd? r) (dec r) r)]
        (recur (quot l 2) (quot r 2) sum))
      sum)))

(build! [1 3 5 7 9 11 13 15])
(println (query 1 5))
(update! 2 10)
(println (query 1 5))
