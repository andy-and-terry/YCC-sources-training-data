(def base-config {:host "localhost" :port 8080})

(def tagged-config (with-meta base-config {:source :defaults :version 1}))

(println "value:" tagged-config)
(println "metadata:" (meta tagged-config))
(println "same value?" (= base-config tagged-config))

(def bumped-config (vary-meta tagged-config update :version inc))
(println "bumped metadata:" (meta bumped-config))

(defn ^{:doc "adds two numbers" :added "1.0"} add [a b]
  (+ a b))

(println "fn metadata:" (select-keys (meta #'add) [:doc :added]))
