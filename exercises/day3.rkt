#lang racket

#|
(define (fact-help num acc)
  (cond [(null? num) null]
        [(eq? 0 num) (* acc 1)]
        [else (fact-help (- num 1) (* acc num))]))

(define (factorial num)
  (fact-help num 1))

(write (factorial 2)) (newline)
(write (factorial 5)) (newline)

|#

;;;;;;;;;;;;;;;;;;;;;;FILTER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (my-filter-help func lst acc)
  (if (null? lst)
      acc
      (my-filter-help func (rest lst)  (if (func (first lst))
                                           (cons (first lst) acc)
                                           acc)
      )
  )
)

(define (my-filter func lst)
    (my-filter-help func (reverse lst) empty))

(write (my-filter even? '(1 2 3 4 5 6))) (newline)


;;;;;;;;;;;;;;APPEND;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (my-append-help lst acc)
  (if (null? lst)
      acc
      (my-append-help (rest lst) (cons (first lst) acc))
  )
)

(define (my-append lst other)
    (my-append-help (reverse lst) other))

;(write (my-append '(1 2 3) '(3 2 1))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;ZIP;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (my-zip-help lst1 lst2 acc)
  (if (or (null? lst1) (null? lst2
      ()
      ())

(define (my-zip lst1 lst2)
  (my-zip-help lst1 lst2 empty)


(write (my-zip '(3 2 1) '(1 2 3))) (newline)


;;;;;;;;;;;;;;;;;;;;;;;;;;;REVERSE;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (my-reverse-help lst acc)
  (if (null? lst)
      acc
      (my-reverse-help (rest lst) (cons (first lst) acc))))

(define (my-reverse lst)
  (my-reverse-help lst empty))

(write (my-reverse '(1 2 3 4))) (newline)