(require '[clojure.zip :as zip])

(def tree [:root [:child1] [:child2 [:grandchild]]])

(def z (zip/vector-zip tree))

(println "root node:" (zip/node z))

(def loc1 (zip/down z))
(println "first item:" (zip/node loc1))

(def loc2 (zip/right loc1))
(println "next sibling:" (zip/node loc2))

(def edited (-> z zip/down zip/right (zip/edit (fn [_] [:child1-renamed])) zip/root))
(println "edited tree:" edited)
