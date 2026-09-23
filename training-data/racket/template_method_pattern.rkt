#lang racket
(require racket/class)

;; The template method fixes the algorithm's skeleton in the base
;; class and defers individual steps to subclasses via override.

(define data-miner%
  (class object%
    (super-new)
    (define/public (mine path)
      (define raw (send this open-file path))
      (define data (send this extract-data raw))
      (send this analyze data))
    (define/public (open-file path) (error "not implemented"))
    (define/public (extract-data raw) (error "not implemented"))
    (define/public (analyze data) (error "not implemented"))))

(define csv-miner%
  (class data-miner%
    (super-new)
    (define/override (open-file path) (format "csv contents of ~a" path))
    (define/override (extract-data raw) (string-split raw " "))
    (define/override (analyze data)
      (printf "CSV analysis of tokens: ~a\n" (length data)))))

(define miner (new csv-miner%))
(send miner mine "report.csv")
