(defn max-area [h]
  (loop [lo 0, hi (dec (count h)), best 0]
    (if (>= lo hi)
      best
      (let [area (* (min (h lo) (h hi)) (- hi lo))
            best (max best area)]
        (if (< (h lo) (h hi))
          (recur (inc lo) hi best)
          (recur lo (dec hi) best))))))

(println (max-area [1 8 6 2 5 4 8 3 7])) ; 49
