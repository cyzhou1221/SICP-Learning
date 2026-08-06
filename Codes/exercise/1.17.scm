#lang sicp

(define (double i) (+ i i))
(define (halve i) (/ i 2))

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((= b 1) a)          ; 终止条件
        ((< b 0) (- (fast-mul a (- b))))
        (else
          (let ((g (double (fast-mul a (halve b)))))
            (if (even? b)
                g
                (+ a g))))))

(fast-mul 3 4)
(fast-mul 3 -4)