;;; Test Cases for the Scheme Project 

;; To run all tests:
;;     python3 scheme_test.py tests.scm
;;


;; The following should work for the initial files.

3
; expect 3

-123
; expect -123

1.25
; expect 1.25

#t
; expect #t

#f
; expect #f

)
; expect Error

;; In the following sections, you should provide test cases, so that by 
;; running 
;;     python3 scheme_test.py tests.scm
;; you can test the portions of the project you've completed.  In fact, 
;; you might consider writing these tests BEFORE tackling the associated
;; problem!

; Problem 1  (the reader)
;   Initially, the project skeleton simply reads and prints the expressions
;   entered.  Later on, it starts evaluating them.  You may therefore need
;   to modify the tests you initially provide for this section when you get
;   to later sections.  For example, initially, entering the symbol x will
;   simply cause the evaluator to print "x" rather than attempting to evaluate
;   it (and getting an error).  Therefore, you may later have to modify
;   x to (e.g.) 'x

; YOUR TEST CASES HERE

'x
; expect x

'(x)
; expect Error

; Problem A2 and B2 (symbol evaluation and simple defines)

; YOUR TEST CASES HERE


; Problem 3 (primitive function calls)

; YOUR TEST CASES HERE

(define x (* 2 2))
; expect 4

(define x (lambda (z y) (+ 1 z) z (* 2 y)))
; expect 

(x 1 2)
; expect 4

(define x (lambda (z y) ((+ 1 z) z (* 2 y))))
; expect 

; expect Error: eval: bad function in : ((+ 1 z) z (* 2 y))


; Problem A4, B4, A5, B5, and 6 (calls on user-defined functions)

; YOUR TEST CASES HERE



; Problem 7 (set!)

; YOUR TEST CASES HERE


; Problem A8 (if, and)

; YOUR TEST CASES HERE

(if 1 2 3)
; expect 2

(if (if (if #t 1 2) '(1) '(2)) (+ 1 1) (- 1 1))
; expect 2

(if (> 2 1) (quote t) ('s))
; expect t

(if #t () ())
; expect ()

(and)
; expect #t

(and and)
; expect Error: unknown identifier: and

(and 1 2 3)
; expect 3

; Problem B8 (cond, or)

; YOUR TEST CASES HERE

(or (+ 1 1) (and (> 1 1) (< (+ 1 1) (+ 2 2))) (> 5 1))
; expect #t

(or)
; expect #f

(or #f #f #f (< 1 2))
; expect #t

(or (< 2 1) (= 2 1) (= 2 2))
; expect #t

(or #f #f #f (< 2 1))
; expect #f

; Problem 9 (let)

; YOUR TEST CASES HERE

(let ((x 2) (y 3)) (* x y))
; expect 6

(let ((x 2) (y 3)) (let ((x 7) (z (+ x y))) (* z x)))
; expect 35

(define x 3) (define y 10)
(let ((x y) (y (+ x 5))) (set! x (+ x 1)) (list x y))
; expect (11 8)

(list x y)
; expect (3 10)

; Extra Credit 1 (let*)

; YOUR TEST CASES HERE


; Extra Credit 2 (case)

; YOUR TEST CASES HERE

(case (1) ((1 2 3) 'sucks) ((4 5 6) 'not)))
;expect sucks



; Problem A10

;; The subsequence of list S for which F outputs a true value (i.e., one
;; other than #f), computed destructively
(define (filter! f s)
   ; *** YOUR CODE HERE ***
   (define (hlpr pred L)
   (cond ((null? L) L)
        	((null? (cdr L)) L)
        	((pred (car (cdr L))) (hlpr pred (cdr L)))  
  		 (else (begin (set-cdr! L (cdr (cdr L)))(hlpr f (cdr L))))))
 (hlpr f s) 
 (if (f (car s)) s (begin (set! s (cdr s)) s))
)

(define (big x) (> x 5))

(define ints (list 1 10 3 8 4 7))
(define ints1 (cdr ints))

(define filtered-ints (filter! big ints))
filtered-ints
; expect (10 8 7)
(eq? filtered-ints ints1)
; expect #t


; Problem A11.

;; The number of ways to change TOTAL with DENOMS
;; At most MAX-COINS total coins can be used.
 (define (count-change total denoms max-coins)
   (cond ((= total 0) 1)
         ((or (< total 0) (null? denoms) (< max-coins 0) ) 0)
         (else (+ (count-change (- total (car denoms)) denoms (- max-coins 1))
                  (count-change total (cdr denoms) max-coins)))))

(define us-coins '(50 25 10 5 1))
(count-change 20 us-coins 18)
; expect 8

(count-change 20 us-coins 2)
; expect 2

(count-change 15 us-coins 2)
; expect 2

(count-change 10 us-coins 2)
; expect 2

(count-change 9 us-coins 2)
; expect 0

; Problem B10

;; Reverse list L destructively, creating no new pairs.  May modify the 
;; cdrs of the items in list L.
(define (reverse! L)
  ; *** YOUR CODE HERE ***
(define (helper prev cur)
	(if (null? cur)
		prev
		(let ((next (cdr cur)))
		(set-cdr! cur prev)
		(helper cur next))))
	(helper '() L))

(define L (list 1 2 3 4))
(define LR (reverse! L))
LR
; expect (4 3 2 1)

(eq? L (list-tail LR 3))
; expect #t	

; Problem B11

;; The number of ways to partition TOTAL, where 
;; each partition must be at most MAX-VALUE
(define (count-partitions total max-value)
  ; *** YOUR CODE HERE ***
)

(count-partitions 5 3)
; expect 5
; Note: The 5 partitions are [[3 2] [3 1 1] [2 2 1] [2 1 1 1] [1 1 1 1 1]]

; Problem 12

;; A list of all ways to partition TOTAL, where  each partition must 
;; be at most MAX-VALUE and there are at most MAX-PIECES partitions.
(define (list-partitions total max-pieces max-value)
  ; *** YOUR CODE HERE ***
  (make-part total max-value max-pieces ())
)

(define (make-part total max-value max-pieces current-partition)
  (cond ((= total 0) (list current-partition))
        ((> (length current-partition) max-pieces) ())
        ((< total 0) ())
        ((< max-value 1) ())
        (else (append (make-part (- total max-value) max-value max-pieces (cons max-value current-partition))
                      (make-part total (- max-value 1) max-pieces current-partition))))
)

(list-partitions 5 2 4)
; expect ((4 1) (3 2))
(list-partitions 7 3 5)
; expect ((5 2) (5 1 1) (4 3) (4 2 1) (3 3 1) (3 2 2))



