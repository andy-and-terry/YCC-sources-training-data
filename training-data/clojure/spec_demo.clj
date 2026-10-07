(require '[clojure.spec.alpha :as s])

(s/def ::name string?)
(s/def ::age (s/and int? #(>= % 0)))
(s/def ::person (s/keys :req-un [::name ::age]))

(def valid-person {:name "Ada" :age 36})
(def invalid-person {:name "Bob" :age -5})

(println (s/valid? ::person valid-person))
(println (s/valid? ::person invalid-person))
(println (s/explain-str ::person invalid-person))

(s/def ::even-int (s/and int? even?))
(println (s/conform (s/coll-of ::even-int) [2 4 6]))
(println (s/conform (s/coll-of ::even-int) [2 3 6]))
