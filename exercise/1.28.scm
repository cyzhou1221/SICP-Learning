#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let ((result (expmod base (/ exp 2) m)))
           (if (and (not (= result 1))
                    (not (= result (- m 1)))
                    (= (remainder (square result) m) 1))
               0
               (remainder (square result) m))))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (miller-rabin-test-repeat n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (define (repeat times)
    (cond ((= times 0) true)
          ((try-it (+ 1 (random (- n 1))))
           (repeat (- times 1)))
          (else false)))
  (repeat 300))  ; 测试 300 次


(miller-rabin-test 561)
(miller-rabin-test 105)

(miller-rabin-test-repeat 561)
(miller-rabin-test-repeat 105)