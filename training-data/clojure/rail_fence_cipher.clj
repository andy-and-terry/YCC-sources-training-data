(defn order [n k]
  (let [cycle (* 2 (dec k))
        rail  (fn [i] (let [r (mod i cycle)] (if (< r k) r (- cycle r))))]
    (sort-by (juxt rail identity) (range n))))

(defn encrypt [t k] (apply str (map #(nth t %) (order (count t) k))))

(defn decrypt [c k]
  (apply str (map second (sort-by first (map vector (order (count c) k) c)))))

(let [c (encrypt "WEAREDISCOVERED" 3)]
  (println c (decrypt c 3)))
