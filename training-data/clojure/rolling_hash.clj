(defn window-hash [s]
  (reduce (fn [h c] (mod (+ (* h 31) (int c)) 1000003)) 0 s))

(doseq [i (range 0 (- (count "abcabc") 2))]
  (println i (window-hash (subs "abcabc" i (+ i 3)))))
