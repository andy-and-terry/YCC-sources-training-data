#lang racket

;; Adapter: wrap an existing interface behind the one client code
;; actually expects, without touching the original implementation.

(define (legacy-print-inches value)
  (printf "legacy: ~a inches\n" value))

;; The adapter exposes print-cm, translating to the legacy units.
(define (make-metric-adapter)
  (lambda (value-cm) (legacy-print-inches (/ value-cm 2.54))))

(define print-cm (make-metric-adapter))
(print-cm 25.4)
(print-cm 5.08)
