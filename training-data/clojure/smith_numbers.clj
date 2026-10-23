(require '[clojure.string :as str])

(defn digit-sum [n]
  (reduce + (map #(- (int %) 48) (str n))))

(defn prime-factors [n]
  (loop [n n p 2 acc []]
    (cond
      (= n 1) acc
      (> (* p p) n) (conj acc n)
      (zero? (mod n p)) (recur (quot n p) p (conj acc p))
      :else (recur n (inc p) acc))))

(defn smith? [n]
  (let [fs (prime-factors n)]
    (and (> (count fs) 1)
         (= (digit-sum n) (reduce + (map digit-sum fs))))))

(println (str/join " " (filter smith? (range 2 100))))
