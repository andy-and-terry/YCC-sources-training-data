(require '[clojure.set :as set])

(def team-a #{:alice :bob :carol :dave})
(def team-b #{:carol :dave :erin :frank})

(println "union:" (set/union team-a team-b))
(println "intersection:" (set/intersection team-a team-b))
(println "difference (a - b):" (set/difference team-a team-b))
(println "subset?" (set/subset? #{:alice :bob} team-a))

(def people [{:id 1 :name "Alice" :dept :eng}
             {:id 2 :name "Bob" :dept :sales}
             {:id 3 :name "Carol" :dept :eng}])

(println "eng dept:" (set/select #(= :eng (:dept %)) (set people)))
(println "names only:" (set/project (set people) [:name]))
