(defmacro unless [test & body] `(if (not ~test) (do ~@body)))
(defmacro my-or [& forms]
  (if (empty? forms) nil
      `(let [v# ~(first forms)] (if v# v# (my-or ~@(rest forms))))))
(defmacro with-timing [label & body]
  `(let [start# (System/nanoTime) result# (do ~@body)]
     (println ~label "ran" (>= (- (System/nanoTime) start#) 0))
     result#))

(println (unless false :yes) (my-or nil false 3))
(println (with-timing "sum" (reduce + (range 1000))))
(println (macroexpand-1 '(unless x y)))
(println (let [x 5] `(inc ~x)))
