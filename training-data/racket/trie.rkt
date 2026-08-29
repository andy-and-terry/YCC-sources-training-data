#lang racket

(define (new-trie-node) (hash 'children (make-hash) 'is-end #f))

(define (trie-insert! root word)
  (let loop ([node root] [chars (string->list word)])
    (cond
      [(null? chars) (hash-set! (hash-ref node 'children) 'end #t)]
      [else
       (define children (hash-ref node 'children))
       (unless (hash-has-key? children (car chars))
         (hash-set! children (car chars) (new-trie-node)))
       (loop (hash-ref children (car chars)) (cdr chars))])))

(displayln "trie built using nested mutable hash tables")
