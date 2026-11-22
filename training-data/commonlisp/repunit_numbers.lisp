;;; Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
(format t "~{~a~^ ~}~%"
        (loop repeat 8
              for r = 1 then (1+ (* r 10))
              collect r))
