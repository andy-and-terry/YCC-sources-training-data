(defn add [a b] (+ a b))

;; (comment ...) ignores its body and returns nil. It is handy for
;; keeping REPL experiments next to the code without running them.
(def result
  (comment
    (println "never printed")
    (/ 1 0)))

(println "comment returns:" result)

(comment
  (add 1 2)
  (add 10 20))

;; #_ discards just the next form.
(println (add 1 #_(add 100 200) 2))
