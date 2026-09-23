(require '[clojure.spec.alpha :as s])

(s/def ::name string?)
(s/def ::age (s/and int? #(>= % 0)))
(s/def ::person (s/keys :req-un [::name ::age]))

(def valid-person {:name "Ada" :age 30})
(def invalid-person {:name "Bob" :age -1})

(println "valid?" (s/valid? ::person valid-person))
(println "valid?" (s/valid? ::person invalid-person))
(println "explain:" (s/explain-str ::person invalid-person))
