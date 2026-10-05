(defn hanoi [n from to via]
  (if (zero? n)
    []
    (concat (hanoi (dec n) from via to)
            [[n from to]]
            (hanoi (dec n) via to from))))

(let [moves (hanoi 3 :a :c :b)]
  (doseq [[disk from to] moves]
    (println "Move disk" disk "from" (name from) "to" (name to)))
  (println "Total moves:" (count moves)))
