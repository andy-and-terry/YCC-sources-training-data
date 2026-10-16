(def triples
  (for [c (range 1 30)
        b (range 1 c)
        a (range 1 b)
        :when (= (* c c) (+ (* a a) (* b b)))]
    [a b c]))

(println triples)
