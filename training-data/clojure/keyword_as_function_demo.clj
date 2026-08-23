(def config {:host "localhost" :port 8080 :debug true})

(println (:host config))
(println (config :port))
(println (get config :missing "default"))
