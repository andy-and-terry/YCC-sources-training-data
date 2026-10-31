(defn digit-product [n]
  (reduce * (map #(Character/digit % 10) (str n))))

(defn persistence [n]
  (loop [n n steps 0]
    (if (< n 10) steps (recur (digit-product n) (inc steps)))))

(doseq [n [39 77 999 10]]
  (println n (persistence n)))
