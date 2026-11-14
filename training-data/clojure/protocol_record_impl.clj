(defprotocol Speaker (speak [this]))
(defrecord Dog [name] Speaker (speak [_] (str name " says woof")))
(defrecord Cat [name] Speaker (speak [_] (str name " says meow")))

(doseq [a [(->Dog "Rex") (->Cat "Tom")]] (println (speak a)))
