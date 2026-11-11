(define (column-title n)
  (if (= n 0)
      ""
      (string-append (column-title (quotient (- n 1) 26))
                     (string (integer->char (+ 65 (remainder (- n 1) 26)))))))

(display (column-title 28)) (display " ") (display (column-title 701)) (newline) ; AB ZY
