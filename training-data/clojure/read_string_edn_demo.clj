(require '[clojure.edn :as edn])

;; edn/read-string parses data safely (no code evaluation)
(def config
  (edn/read-string "{:name \"svc\" :port 8080 :tags #{:a :b} :limits [1 2.5 3N]}"))

(println config)
(println (:port config))
(println (class (:tags config)) (class (last (:limits config))))

;; round trip data through a string
(def data {:id 7 :items [{:sku "a1" :qty 2} {:sku "b2" :qty 5}]})
(def text (pr-str data))
(println text)
(println (= data (edn/read-string text)))

;; reading with defaults and custom tag readers
(println (edn/read-string {:default (fn [tag value] [:unknown tag value])} "#my/tag 42"))
(println (edn/read-string {:readers {'point (fn [[x y]] {:x x :y y})}} "#point [3 4]"))

;; reading multiple forms from a reader
(with-open [r (java.io.PushbackReader. (java.io.StringReader. "1 :two \"three\" [4]"))]
  (println (take-while #(not= % ::eof) (repeatedly #(edn/read {:eof ::eof} r)))))

;; invalid input throws
(println (try (edn/read-string "{:a") (catch Exception e (str "parse error: " (ex-message e)))))
