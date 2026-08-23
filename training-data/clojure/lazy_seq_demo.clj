(defn fib-seq []
  ((fn fib [a b] (lazy-seq (cons a (fib b (+ a b))))) 0 1))

(println (take 11 (fib-seq)))
