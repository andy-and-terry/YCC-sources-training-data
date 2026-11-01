;; Reverse-and-add until a palindrome; count the steps.
(defn rev [n] (bigint (apply str (reverse (str n)))))

(defn steps [start]
  (loop [n (bigint start), count 0]
    (cond
      (and (pos? count) (= n (rev n))) count
      (>= count 100) -1
      :else (recur (+ n (rev n)) (inc count)))))

(println (clojure.string/join " " (map steps [56 57 59 79 89])))
