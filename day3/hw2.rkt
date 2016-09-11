#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.

(define (interpret op a b c)
    (cond ((eq? op 'ADD)    (+ a b))
          ((eq? op 'SUB)    (- a b))
          ((eq? op 'MUL)    (* a b))
          ((eq? op 'DIV)    (/ a b))
          ((eq? op 'GT)     (> a b))
          ((eq? op 'LT)     (< a b))
          ((eq? op 'GE)     (<= a b))
          ((eq? op 'LE)     (>= a b))
          ((eq? op 'EQ)     (not (equal? a b)))
          ((eq? op 'NEQ)    (not (equal? a b)))
          ((eq? op 'IPH)    (if (a) (b) (c)))
        ))

;(write (calculate '(ADD 3 4))) (newline) ;; --> 7

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(define (calculate x)
    (interpret (first x)
        (if (number? (first (rest x)))
            (first (rest x))
            (calculate (first (rest x))))
        (if (number? (first (rest (rest x))))
            (first (rest (rest x)))
            (calculate (first (rest (rest x)))))
        (if (eq? 'IPH (first x))
            (first (rest (rest (rest x))))
            (1))
    )
)

(write (calculate '(ADD 3 4))) (newline) ;; --> 7
(write (calculate '(ADD 3 (MUL 4 5)))) (newline) ;; --> 23   ;; what is the equivalent construction using list?
(write (calculate '(SUB (ADD 3 4) (MUL 5 6)))) (newline);; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

	(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
	(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(calculate '(AND (GT (ADD 3 4) (MUL 5 6))) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #f

;;; 5. Add IPH
#|
(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4
|#