(def result
  (as-> 5 x
    (* x 2)
    (+ x 3)
    (str "value: " x)))

(println result)

(def sb
  (doto (StringBuilder.)
    (.append "Hello")
    (.append ", ")
    (.append "world!")))

(println (.toString sb))
