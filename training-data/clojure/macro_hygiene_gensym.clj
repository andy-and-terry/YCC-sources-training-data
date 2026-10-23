;; Writing a hygienic macro: auto-gensym (x#) avoids variable capture

(defmacro unsafe-add-ten [expr]
  `(let [~'x 10]                    ; deliberately captures the name "x"
     (+ ~'x ~expr)))

(defmacro safe-add-ten [expr]
  `(let [x# 10]                     ; x# expands to a unique symbol
     (+ x# ~expr)))

(let [x 1]
  (println "unsafe sees inner x:" (unsafe-add-ten x))   ; 10 + 10
  (println "safe uses outer x:  " (safe-add-ten x)))    ; 10 + 1

;; Explicit gensym, useful when the same name is needed in several places
(defmacro with-timing [label & body]
  (let [start (gensym "start")]
    `(let [~start (System/nanoTime)
           value# (do ~@body)]
       (println ~label "finished, elapsed non-negative:"
                (>= (- (System/nanoTime) ~start) 0))
       value#)))

(println "value:" (with-timing "sum" (reduce + (range 1000))))

;; Inspect an expansion
(println (macroexpand-1 '(safe-add-ten 5)))
