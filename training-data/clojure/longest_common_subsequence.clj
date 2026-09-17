(defn lcs-length [a b]
  (let [n (count a)
        m (count b)]
    (loop [i 0
           dp (vec (repeat (inc n) (vec (repeat (inc m) 0))))]
      (if (= i n)
        (get-in dp [n m])
        (recur (inc i)
               (reduce
                (fn [dp j]
                  (assoc-in dp [(inc i) (inc j)]
                            (if (= (nth a i) (nth b j))
                              (inc (get-in dp [i j]))
                              (max (get-in dp [i (inc j)])
                                   (get-in dp [(inc i) j])))))
                dp
                (range m)))))))

(println (lcs-length "ABCBDAB" "BDCABA"))
(println (lcs-length "AGGTAB" "GXTXAYB"))
