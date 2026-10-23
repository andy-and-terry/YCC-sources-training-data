(require '[clojure.string :as str])

(def fibs
  (take-while #(<= % 100)
              (map first (iterate (fn [[a b]] [b (+ a b)]) [1 2]))))

(defn zeckendorf [n]
  (loop [n n fs (reverse fibs) acc []]
    (cond
      (zero? n) acc
      (<= (first fs) n) (recur (- n (first fs)) (rest fs) (conj acc (first fs)))
      :else (recur n (rest fs) acc))))

(println (str/join " " (zeckendorf 100)))
