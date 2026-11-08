(defn rot47 [s]
  (apply str
         (map (fn [c]
                (let [n (int c)]
                  (if (<= 33 n 126)
                    (char (+ 33 (mod (+ (- n 33) 47) 94)))
                    c)))
              s)))

(let [e (rot47 "Hello, World!")]
  (println e)
  (println (rot47 e)))
