(def config {:db {:host "localhost" :port 5432} :cache {:ttl 60}})

(println (get-in config [:db :port]))
(println (get-in config [:db :user] "none"))
(println (assoc-in config [:db :port] 6543))
(println (assoc-in config [:log :level] :debug))
(println (update-in config [:cache :ttl] * 2))
