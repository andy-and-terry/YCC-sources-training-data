;; The adapter pattern wraps an incompatible interface behind the one
;; the caller expects, without modifying either side. Here a closure
;; stands in for the "object" -- calling it returns its voltage.

(define (make-european-socket)
  (lambda () 230))

(define (make-us-adapter european-socket)
  (lambda () (* (/ (european-socket) 230) 120)))

(define (power-device plug)
  (display "device receives ")
  (display (plug))
  (display "V")
  (newline))

(define socket (make-european-socket))
(define adapter (make-us-adapter socket))
(power-device adapter)
