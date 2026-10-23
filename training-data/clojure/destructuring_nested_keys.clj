;; Destructuring in fn args, let, and loop: vectors, maps, :keys, :or, :as

(defn describe-user [{:keys [name age] {:keys [city country] :or {country "unknown"}} :address :as user}]
  (str name " (" age ") lives in " city ", " country
       " [" (count user) " fields]"))

(println (describe-user {:name "Ana" :age 31 :address {:city "Lisbon" :country "Portugal"}}))
(println (describe-user {:name "Bo" :age 27 :address {:city "Oslo"}}))

;; Sequential destructuring with rest and :as
(let [[first-item second-item & others :as all] [10 20 30 40 50]]
  (println "first:" first-item "second:" second-item "others:" others "all:" all))

;; Nested vectors
(let [[[a b] [c d]] [[1 2] [3 4]]]
  (println "sum of corners:" (+ a b c d)))

;; Map destructuring with string and symbol keys
(let [{:strs [host port]} {"host" "localhost" "port" 8080}]
  (println (str host ":" port)))

;; Rest args as a map (keyword arguments)
(defn connect [host & {:keys [port timeout] :or {port 80 timeout 30}}]
  (str host ":" port " timeout=" timeout))

(println (connect "example.org"))
(println (connect "example.org" :port 443 :timeout 5))

;; Destructuring inside loop
(loop [[x & xs] [1 2 3 4] total 0]
  (if x (recur xs (+ total x)) (println "total:" total)))
