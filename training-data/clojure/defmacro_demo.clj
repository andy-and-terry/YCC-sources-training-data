(defmacro unless [test then else]
  `(if (not ~test) ~then ~else))

(println (unless false "was false" "was true"))
(println (unless true "was false" "was true"))

(defmacro my-or
  ([] nil)
  ([x] x)
  ([x & rest] `(let [result# ~x]
                 (if result# result# (my-or ~@rest)))))

(println (my-or false nil 3 4))

(println (macroexpand '(unless false :a :b)))
