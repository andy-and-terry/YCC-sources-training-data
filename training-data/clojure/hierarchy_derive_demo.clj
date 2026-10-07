;; ad-hoc hierarchies with derive/isa? and multimethod dispatch
(derive ::dog ::mammal)
(derive ::cat ::mammal)
(derive ::mammal ::animal)
(derive ::sparrow ::bird)
(derive ::bird ::animal)

(println (isa? ::dog ::animal))
(println (isa? ::dog ::bird))
(println (parents ::dog))
(println (ancestors ::dog))
(println (descendants ::animal))

(defmulti describe identity)
(defmethod describe ::animal [x] (str (name x) " is some animal"))
(defmethod describe ::mammal [x] (str (name x) " is a warm-blooded mammal"))
(defmethod describe ::sparrow [x] "a small bird")

(println (describe ::dog))     ; falls back to ::mammal (closest ancestor)
(println (describe ::sparrow))
(println (describe ::bird))    ; falls back to ::animal

;; undoing a relationship
(underive ::cat ::mammal)
(println (isa? ::cat ::animal))
