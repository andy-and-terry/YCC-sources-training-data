#lang racket

(require racket/set)

(define alphabet (string->list "abcdefghijklmnopqrstuvwxyz"))

(define (char-at-index str i letter)
  (define chars (string->list str))
  (list->string
   (for/list ([c chars] [idx (in-naturals)])
     (if (= idx i) letter c))))

(define (neighbors word word-set)
  (define n (string-length word))
  (for*/list ([i (in-range n)]
              [letter alphabet]
              #:unless (char=? letter (string-ref word i))
              #:when (set-member? word-set (char-at-index word i letter)))
    (char-at-index word i letter)))

(define (word-ladder-length begin-word end-word words)
  (define word-set (list->set words))
  (if (not (set-member? word-set end-word))
      0
      (let loop ([frontier (list begin-word)] [visited (set-add (set) begin-word)] [dist 1])
        (cond
          [(null? frontier) 0]
          [(member end-word frontier) dist]
          [else
           (define candidates (apply append (map (lambda (w) (neighbors w word-set)) frontier)))
           (define fresh (filter (lambda (w) (not (set-member? visited w))) candidates))
           (define next-visited (foldl (lambda (w s) (set-add s w)) visited fresh))
           (loop fresh next-visited (add1 dist))]))))

(define words (list "hot" "dot" "dog" "lot" "log" "cog"))
(displayln (word-ladder-length "hit" "cog" words))
