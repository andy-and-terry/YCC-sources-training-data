;; A simple hash table implemented with separate chaining over a
;; vector of association-list buckets.

(define (make-hash-table size)
  (cons size (make-vector size '())))

(define (hash-table-size table) (car table))
(define (hash-table-buckets table) (cdr table))

(define (string-hash key size)
  (let loop ((chars (string->list key)) (acc 0))
    (if (null? chars)
        (modulo acc size)
        (loop (cdr chars) (+ (* acc 31) (char->integer (car chars)))))))

(define (hash-table-set! table key value)
  (let* ((size (hash-table-size table))
         (buckets (hash-table-buckets table))
         (idx (string-hash key size))
         (bucket (vector-ref buckets idx))
         (filtered (filter (lambda (pair) (not (string=? (car pair) key))) bucket)))
    (vector-set! buckets idx (cons (cons key value) filtered))))

(define (hash-table-get table key)
  (let* ((size (hash-table-size table))
         (buckets (hash-table-buckets table))
         (idx (string-hash key size))
         (bucket (vector-ref buckets idx))
         (entry (assoc key bucket)))
    (if entry (cdr entry) #f)))

(define table (make-hash-table 8))
(hash-table-set! table "apple" 1)
(hash-table-set! table "banana" 2)
(hash-table-set! table "apple" 3)

(display (hash-table-get table "apple"))
(newline)
(display (hash-table-get table "banana"))
(newline)
(display (hash-table-get table "cherry"))
(newline)
