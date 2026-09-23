(def text "order-42 shipped, order-7 pending, order-108 cancelled")

(println "all matches:" (re-seq #"order-\d+" text))

(println "first match:" (re-find #"order-(\d+)" text))

(defn valid-email? [s]
  (some? (re-matches #"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" s)))

(println (valid-email? "ada@example.com"))
(println (valid-email? "not-an-email"))
