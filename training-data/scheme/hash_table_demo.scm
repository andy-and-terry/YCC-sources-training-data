;; A minimal hash table built from a vector of association-list buckets
;; (separate chaining), keyed by strings.

(define (make-hash-table size) (cons size (make-vector size '())))

(define (hash-string s size)
  (let ((n (string-length s)))
    (let loop ((i 0) (h 0))
      (if (= i n)
          (modulo h size)
          (loop (+ i 1) (+ (* h 31) (char->integer (string-ref s i))))))))

(define (hash-set! table key value)
  (let* ((size (car table))
         (buckets (cdr table))
         (index (hash-string key size))
         (bucket (vector-ref buckets index))
         (without (filter (lambda (e) (not (string=? (car e) key))) bucket)))
    (vector-set! buckets index (cons (cons key value) without))))

(define (hash-get table key)
  (let* ((size (car table))
         (buckets (cdr table))
         (index (hash-string key size))
         (entry (assoc key (vector-ref buckets index))))
    (if entry (cdr entry) #f)))

(define table (make-hash-table 8))
(hash-set! table "apple" 1)
(hash-set! table "banana" 2)
(hash-set! table "cherry" 3)
(hash-set! table "apple" 10)

(display (hash-get table "apple"))
(newline)
(display (hash-get table "banana"))
(newline)
(display (hash-get table "missing"))
(newline)
