#lang racket

;; Adapts a legacy Celsius-only sensor to the Fahrenheit-based
;; interface newer client code expects, without modifying either side.
(struct legacy-sensor (celsius-thunk))

(define (make-legacy-sensor) (legacy-sensor (lambda () 21.5)))

(struct fahrenheit-adapter (sensor))

(define (fahrenheit-temp adapter)
  (define c ((legacy-sensor-celsius-thunk (fahrenheit-adapter-sensor adapter))))
  (+ (* c 9/5) 32))

(define (report source)
  (printf "Current temperature: ~aF\n" (exact->inexact (fahrenheit-temp source))))

(report (fahrenheit-adapter (make-legacy-sensor)))
