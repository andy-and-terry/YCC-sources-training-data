;; defonce only evaluates its init expression if the var is unbound,
;; so reloading a file does not reset the state.
(defonce counter (atom 0))

(swap! counter inc)
(swap! counter inc)

;; This second definition is ignored because `counter` already exists.
(defonce counter (atom 100))

(println "counter:" @counter)

;; Compare with def, which rebinds every time.
(def fresh (atom 0))
(def fresh (atom 100))
(println "fresh:" @fresh)
