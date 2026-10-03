(defn z-array [s]
  (let [n (count s)
        z (int-array n)]
    (loop [i 1 left 0 right 0]
      (when (< i n)
        (let [z-i (if (< i right) (min (- right i) (aget z (- i left))) 0)
              z-i (loop [k z-i]
                    (if (and (< (+ i k) n) (= (nth s k) (nth s (+ i k))))
                      (recur (inc k))
                      k))]
          (aset z i z-i)
          (if (> (+ i z-i) right)
            (recur (inc i) i (+ i z-i))
            (recur (inc i) left right)))))
    z))

(defn z-search [text pattern]
  (let [combined (str pattern "$" text)
        z (z-array combined)
        m (count pattern)]
    (keep-indexed (fn [idx v] (when (= v m) (- idx m 1))) z)))

(println (vec (z-search "abxabcabcaby" "abcaby")))
(println (vec (z-search "hello world" "xyz")))
