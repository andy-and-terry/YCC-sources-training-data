(defn build-lps [pattern]
  (let [m (count pattern)
        lps (int-array m)]
    (loop [i 1 len 0]
      (when (< i m)
        (cond
          (= (nth pattern i) (nth pattern len))
          (do (aset lps i (inc len))
              (recur (inc i) (inc len)))

          (pos? len)
          (recur i (aget lps (dec len)))

          :else
          (do (aset lps i 0)
              (recur (inc i) 0)))))
    lps))

(defn kmp-search [text pattern]
  (let [n (count text)
        m (count pattern)
        lps (build-lps pattern)]
    (loop [i 0 j 0]
      (cond
        (= j m) (- i j)
        (>= i n) -1
        (= (nth text i) (nth pattern j)) (recur (inc i) (inc j))
        (pos? j) (recur i (aget lps (dec j)))
        :else (recur (inc i) 0)))))

(println (kmp-search "abxabcabcaby" "abcaby"))
(println (kmp-search "hello world" "xyz"))
