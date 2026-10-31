(defn prime-factors [n]
  (loop [n n p 2 acc []]
    (cond
      (= n 1) acc
      (> (* p p) n) (conj acc n)
      (zero? (mod n p)) (recur (quot n p) p (conj acc p))
      :else (recur n (inc p) acc))))

(defn sphenic? [n]
  (let [fs (prime-factors n)]
    (and (= 3 (count fs)) (= 3 (count (distinct fs))))))

(println (filter sphenic? (range 2 80)))
