;; Huffman coding: repeatedly merge the two lowest-frequency nodes
;; (freq . label) into a parent node until one tree remains, then
;; read off a 0/1 code per leaf top-down.

(define (leaf? label) (symbol? label))

(define (insert-by-freq node lst)
  (cond ((null? lst) (list node))
        ((<= (car node) (car (car lst))) (cons node lst))
        (else (cons (car lst) (insert-by-freq node (cdr lst))))))

(define (sorted-nodes freqs)
  (fold-left (lambda (acc pair) (insert-by-freq pair acc)) '() freqs))

(define (build-tree nodes)
  (if (null? (cdr nodes))
      (car nodes)
      (let* ((a (car nodes)) (b (cadr nodes)) (rest (cddr nodes))
             (merged (cons (+ (car a) (car b)) (list (cdr a) (cdr b)))))
        (build-tree (insert-by-freq merged rest)))))

(define (assign-codes node prefix)
  (let ((label (cdr node)))
    (if (leaf? label)
        (list (cons label prefix))
        (append (assign-codes (car label) (string-append prefix "0"))
                (assign-codes (cadr label) (string-append prefix "1"))))))

(define (huffman-codes freqs)
  (assign-codes (build-tree (sorted-nodes freqs)) ""))

(display (huffman-codes '((5 . a) (9 . b) (12 . c) (13 . d))))
(newline)
