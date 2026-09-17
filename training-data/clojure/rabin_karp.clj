(def base 256)
(def modulus 101)

(defn- pow-mod [b e m]
  (reduce (fn [acc _] (mod (* acc b) m)) 1 (range e)))

(defn rabin-karp [text pattern]
  (let [n (count text)
        m (count pattern)
        h (pow-mod base (dec m) modulus)
        code (fn [s i] (int (nth s i)))
        pattern-hash (reduce (fn [acc i] (mod (+ (* acc base) (code pattern i)) modulus)) 0 (range m))
        window-hash-0 (reduce (fn [acc i] (mod (+ (* acc base) (code text i)) modulus)) 0 (range m))]
    (loop [i 0
           window-hash window-hash-0
           result []]
      (if (> i (- n m))
        result
        (let [matched? (and (= window-hash pattern-hash) (= (subs text i (+ i m)) pattern))
              result (if matched? (conj result i) result)]
          (if (= i (- n m))
            result
            (let [rolled (mod (+ (* (- window-hash (* (code text i) h)) base) (code text (+ i m))) modulus)
                  rolled (if (neg? rolled) (+ rolled modulus) rolled)]
              (recur (inc i) rolled result))))))))

(println (rabin-karp "ababcabcabababd" "ababd"))
(println (rabin-karp "aaaaa" "aa"))
