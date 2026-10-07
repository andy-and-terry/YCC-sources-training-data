(defn shift-char [k c]
  (cond
    (Character/isUpperCase c) (char (+ 65 (mod (+ (- (int c) 65) k) 26)))
    (Character/isLowerCase c) (char (+ 97 (mod (+ (- (int c) 97) k) 26)))
    :else c))

(defn caesar [text k]
  (apply str (map #(shift-char k %) text)))

(let [enc (caesar "Hello, World!" 3)]
  (println enc)
  (println (caesar enc -3)))
