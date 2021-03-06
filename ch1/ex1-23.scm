;; Example 1.23

(define runtime current-inexact-milliseconds)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next a)
  (if (= a 2) 3
      (+ a 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

;; timed prime test functions

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed)
  (display " *** ")
  (display elapsed)
  #t)

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(timed-prime-test 19)
(timed-prime-test 199)
(timed-prime-test 1999)
(timed-prime-test 199999)
(timed-prime-test 10000079)
(timed-prime-test 19999999199)

;; Results using 1.22 function

; sqrt(n)
;19 *** 0.134033203125#t
;199 *** 0.009033203125#t
;1999 *** 0.01513671875#t
;199999 *** 0.134033203125#t
;10000079 *** 0.930908203125#t
;19999999199 *** 91.281982421875#t

; sqrt(n) / 2
;; Results using this function
;19 *** 0.092041015625#t
;199 *** 0.005859375#t
;1999 *** 0.010986328125#t
;199999 *** 0.0830078125#t
;10000079 *** 0.56298828125#t
;19999999199 *** 49.744140625#t

; As we can see, for example, 91 ~= 49 * 2