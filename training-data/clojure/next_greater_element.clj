(defn pop-while-le [stack value]
  (if (and (seq stack) (<= (peek stack) value))
    (recur (pop stack) value)
    stack))

(defn next-greater-elements [nums]
  (let [n (count nums)]
    (loop [i (dec n)
           stack []
           result (vec (repeat n -1))]
      (if (< i 0)
        result
        (let [trimmed (pop-while-le stack (nums i))
              greater (if (seq trimmed) (peek trimmed) -1)]
          (recur (dec i) (conj trimmed (nums i)) (assoc result i greater)))))))

(println (next-greater-elements [4 5 2 10 8]))
(println (next-greater-elements [1 2 3 4]))
