(defprotocol Speaker (speak [this]))
(defrecord Dog [name] Speaker (speak [_] (str name ": woof")))
(defrecord Cat [name] Speaker (speak [_] (str name ": meow")))
(doseq [a [(->Dog "rex") (->Cat "tom")]] (println (speak a)))
