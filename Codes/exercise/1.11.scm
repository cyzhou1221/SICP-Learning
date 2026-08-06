#lang sicp

(define (f n)
  (if (and (< n 3) (> n -1))
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (new-f count)
  (f-iter 0 1 2 count))

(define (f-iter a b c count)
  (cond ((= count 0) a)
        ((= count 1) b)
        (else
          (f-iter b c (+ (* 3 a)
                         (* 2 b)
                         c)
                  (- count 1)))))

(f 5)
(new-f 5)
(f 2)
(new-f 2)

