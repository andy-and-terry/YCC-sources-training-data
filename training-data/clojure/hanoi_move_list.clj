(defn hanoi [n from via to]
  (if (zero? n)
    []
    (concat (hanoi (dec n) from to via)
            [(str from "->" to)]
            (hanoi (dec n) via from to))))

(let [m (hanoi 3 "A" "B" "C")]
  (println (count m) m))
