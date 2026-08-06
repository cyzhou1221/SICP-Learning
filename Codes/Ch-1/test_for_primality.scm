#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
                n
                (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))


(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes start count)
  (cond ((= count 0)
         (newline))
        ((prime? start)
         (timed-prime-test start)
         (search-for-primes (+ start 2) (- count 1)))
        (else
         (search-for-primes (+ start 2) count))))

(search-for-primes 10000001 3)
(search-for-primes 10000000001 3)