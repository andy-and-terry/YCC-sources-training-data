(require '[clojure.core.async :refer [chan go >! <! >!! <!! alts!! timeout close!]])

(def ch (chan))

(go
  (>! ch (+ 1 2))
  (close! ch))

(println "received:" (<!! ch))

(def fast (chan))
(def slow (chan))

(go (>! fast :fast-result))
(go (do (<! (timeout 50)) (>! slow :slow-result)))

(let [[value port] (alts!! [fast slow])]
  (println "winner:" value "from" (if (= port fast) "fast" "slow")))
