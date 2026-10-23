;; Ad hoc hierarchies with derive / isa? and multimethod dispatch on them

(derive ::cat ::animal)
(derive ::dog ::animal)
(derive ::lion ::cat)
(derive ::poodle ::dog)

(println "lion is a cat?" (isa? ::lion ::cat))
(println "lion is an animal?" (isa? ::lion ::animal))
(println "dog is a cat?" (isa? ::dog ::cat))
(println "ancestors of poodle:" (sort (ancestors ::poodle)))
(println "descendants of animal:" (sort (descendants ::animal)))

(defmulti sound :kind)
(defmethod sound ::animal [_] "generic noise")
(defmethod sound ::cat [_] "meow")
(defmethod sound ::dog [_] "woof")

;; ::lion has no method of its own; dispatch falls back to ::cat
(doseq [k [::lion ::poodle ::cat]]
  (println (name k) "says" (sound {:kind k})))

;; Hierarchies can also be local values
(let [h (-> (make-hierarchy)
            (derive :square :shape)
            (derive :circle :shape))]
  (println "local square isa shape:" (isa? h :square :shape))
  (println "global square isa shape:" (isa? :square :shape)))

(underive ::lion ::cat)
(println "after underive:" (isa? ::lion ::cat))
