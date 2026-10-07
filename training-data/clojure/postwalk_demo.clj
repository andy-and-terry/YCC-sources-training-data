(require '[clojure.walk :as walk])

(def data {:a 1 :b [2 3 {:c 4}]})

;; increment every number anywhere in the structure
(println (walk/postwalk #(if (number? %) (inc %) %) data))

;; keywordize string keys
(println (walk/keywordize-keys {"x" 1 "y" {"z" 2}}))
(println (walk/stringify-keys {:x 1 :y {:z 2}}))

;; symbol substitution
(println (walk/postwalk-replace {'a 1 'b 2} '(+ a (* b a))))
