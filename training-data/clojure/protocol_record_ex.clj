(defprotocol Speaker (speak [this]))

(defrecord Dog [name] Speaker (speak [_] (str name " barks")))
(defrecord Cat [name] Speaker (speak [_] (str name " meows")))

(doseq [a [(->Dog "rex") (->Cat "tom")]]
  (println (speak a)))
