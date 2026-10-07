(defn pq-parent [i] (quot (dec i) 2))
(defn pq-left [i] (inc (* 2 i)))
(defn pq-right [i] (+ 2 (* 2 i)))

(defn pq-push [heap value]
  (let [h0 (conj heap value)]
    (loop [h h0 i (dec (count h0))]
      (if (and (pos? i) (< (nth h i) (nth h (pq-parent i))))
        (let [p (pq-parent i)]
          (recur (assoc h i (nth h p) p (nth h i)) p))
        h))))

(defn pq-sift-down [heap i]
  (let [n (count heap)
        l (pq-left i)
        r (pq-right i)
        smallest (if (and (< l n) (< (nth heap l) (nth heap i))) l i)
        smallest (if (and (< r n) (< (nth heap r) (nth heap smallest))) r smallest)]
    (if (= smallest i)
      heap
      (recur (assoc heap i (nth heap smallest) smallest (nth heap i)) smallest))))

(defn pq-pop [heap]
  (let [n (count heap)]
    (if (<= n 1)
      [(first heap) []]
      (let [top (first heap)
            moved (assoc (vec (butlast heap)) 0 (last heap))]
        [top (pq-sift-down moved 0)]))))

(def heap (reduce pq-push [] [5 2 8 1 9 3]))
(println "heap:" heap)

(loop [h heap acc []]
  (if (empty? h)
    (println "sorted via pops:" acc)
    (let [[top rest-h] (pq-pop h)]
      (recur rest-h (conj acc top)))))
