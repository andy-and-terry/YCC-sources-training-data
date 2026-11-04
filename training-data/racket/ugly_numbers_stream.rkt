#lang racket
(require racket/stream)

(define (merge a b)
  (cond [(< (stream-first a) (stream-first b))
         (stream-cons (stream-first a) (merge (stream-rest a) b))]
        [(> (stream-first a) (stream-first b))
         (stream-cons (stream-first b) (merge a (stream-rest b)))]
        [else (stream-cons (stream-first a) (merge (stream-rest a) (stream-rest b)))]))

(define ugly
  (stream-cons 1 (merge (stream-map (λ (x) (* 2 x)) ugly)
                        (merge (stream-map (λ (x) (* 3 x)) ugly)
                               (stream-map (λ (x) (* 5 x)) ugly)))))

(displayln (stream->list (stream-take ugly 12)))
