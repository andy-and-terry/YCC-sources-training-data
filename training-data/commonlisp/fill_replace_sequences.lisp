;; In-place sequence editing with FILL, REPLACE, and SUBSTITUTE

(let ((v (make-array 8 :initial-element 0)))
  (fill v 7 :start 2 :end 5)
  (format t "fill range:  ~a~%" v)
  (fill v 1)
  (format t "fill all:    ~a~%" v))

;; REPLACE copies elements from one sequence into another
(let ((target (copy-seq "abcdefgh"))
      (source "XYZ"))
  (replace target source :start1 2)
  (format t "replace:     ~a~%" target)
  (replace target "12345" :start1 5 :end1 8)   ; limited by :end1
  (format t "bounded:     ~a~%" target))

;; Overlapping region is handled safely when copying within one vector
(let ((v (vector 1 2 3 4 5 6)))
  (replace v v :start1 0 :start2 2)
  (format t "shift left:  ~a~%" v))

;; SUBSTITUTE returns a new sequence; NSUBSTITUTE modifies in place
(let* ((lst (list 1 2 3 2 1))
       (new (substitute 99 2 lst)))
  (format t "substitute:  ~a (original ~a)~%" new lst)
  (nsubstitute 0 1 lst)
  (format t "nsubstitute: ~a~%" lst))

(format t "substitute-if: ~a~%"
        (substitute-if #\* #'digit-char-p "a1b22c333"))
