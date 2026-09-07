(defn sliding-window-max [nums k]
  (loop [i 0
         deque []
         result []]
    (if (= i (count nums))
      result
      (let [deque (into [] (remove #(<= (nums %) (nums i)) deque))
            deque (conj deque i)
            deque (if (<= (first deque) (- i k)) (subvec deque 1) deque)]
        (recur (inc i) deque (if (>= i (dec k)) (conj result (nums (first deque))) result))))))

(println (sliding-window-max [1 3 -1 -3 5 3 6 7] 3))
