(defn connect [host & {:keys [port timeout] :or {port 80 timeout 30}}]
  (str host ":" port " timeout=" timeout))

(println (connect "example.com"))
(println (connect "example.com" :port 8080))
(println (connect "example.com" :timeout 5 :port 443))
