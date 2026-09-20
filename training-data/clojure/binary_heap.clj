(def heap (atom []))

(defn heap-swap! [i j]
  (swap! heap #(assoc % i (% j) j (% i))))

(defn heap-push! [value]
  (swap! heap conj value)
  (loop [i (dec (count @heap))]
    (let [parent (quot (dec i) 2)]
      (when (and (pos? i) (< (@heap i) (@heap parent)))
        (heap-swap! i parent)
        (recur parent)))))

(defn heap-pop! []
  (let [top (first @heap)
        last-idx (dec (count @heap))]
    (heap-swap! 0 last-idx)
    (swap! heap pop)
    (loop [i 0]
      (let [left (inc (* 2 i))
            right (+ 2 (* 2 i))
            n (count @heap)
            smallest-of-left (if (and (< left n) (< (@heap left) (@heap i))) left i)
            smallest (if (and (< right n) (< (@heap right) (@heap smallest-of-left))) right smallest-of-left)]
        (when (not= smallest i)
          (heap-swap! i smallest)
          (recur smallest))))
    top))

(doseq [v [5 2 8 1 9 3]] (heap-push! v))
(println (repeatedly 6 heap-pop!))
