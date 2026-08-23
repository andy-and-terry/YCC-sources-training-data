(defn valid-parens? [s]
  (let [pairs {\) \( \] \[ \} \{}]
    (loop [chars (seq s) stack []]
      (cond
        (empty? chars) (empty? stack)
        (contains? pairs (first chars))
        (if (and (seq stack) (= (peek stack) (pairs (first chars))))
          (recur (rest chars) (pop stack))
          false)
        :else (recur (rest chars) (conj stack (first chars)))))))

(println (valid-parens? "({[]})"))
(println (valid-parens? "(]"))
