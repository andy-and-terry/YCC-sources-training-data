(defn perfect-square? [n]
  (and (>= n 0)
       (let [r (long (Math/round (Math/sqrt n)))]
         (= (* r r) n))))

(println (filter perfect-square? (range 30)))
