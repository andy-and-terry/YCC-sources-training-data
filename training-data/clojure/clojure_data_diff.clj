(require '[clojure.data :as data])

;; clojure.data/diff returns [only-in-a only-in-b in-both]
(let [old-cfg {:host "localhost" :port 8080 :debug true :tags #{:a :b}}
      new-cfg {:host "localhost" :port 9090 :tls true :tags #{:b :c}}
      [removed added same] (data/diff old-cfg new-cfg)]
  (println "only in old:" removed)
  (println "only in new:" added)
  (println "in both:   " same))

;; Works on vectors, comparing by index
(let [[a b both] (data/diff [1 2 3 4] [1 2 9 4 5])]
  (println "a:" a)
  (println "b:" b)
  (println "both:" both))

;; Nested maps are diffed recursively
(let [[a b both] (data/diff {:user {:name "Al" :role :admin}}
                            {:user {:name "Al" :role :guest}})]
  (println a b both))

;; Identical values yield nil for the differences
(println (data/diff {:x 1} {:x 1}))
