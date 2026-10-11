(ns demo.core
  (:require [clojure.string :as str]
            [clojure.set :refer [union intersection]]))

(println (str/upper-case "namespaced"))
(println (union #{1 2} #{2 3}))
(println (intersection #{1 2 3} #{2 3 4}))
(println (ns-name *ns*))
