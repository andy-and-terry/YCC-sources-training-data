;; Emirps below 200; expect 15.
(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn rev [n] (parse-long (apply str (reverse (str n)))))
(let [found (filter #(and (not= (rev %) %) (prime? %) (prime? (rev %))) (range 2 200))]
  (println (count found) found))
