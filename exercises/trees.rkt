#lang racket

(define (tree-add1 tree)
    (cond ((null? tree)     tree)
          ((list? tree)     (cons (tree-add1 (car tree)) (tree-add1 (cdr tree))))
          ((number? tree)   (+ 1 tree))
    )
)

;(display (tree-add1 '(1 2 3))) (newline) ;; -> (2 3 4 5)
;(display (tree-add1 '(1 (2 3 4)))) (newline) ;; -> (2 (3 4 5))
;(display (tree-add1 '((1 2) 3 4))) (newline) ;; -> (2 (3 4 5))
;(display (tree-add1 '((1 2) 3 ))) (newline) ;; -> (2 (3 4 5))
;(display (tree-add1 '(1 (2 3) 3 4))) (newline) ;; -> (2 (3 4 5))

(define (tree-max-depth tree)
  (max
    (map
      (lambda (ele)
        (cond [(null? ele)    0]
              [(number? ele)  1]
              [(list? ele)    (+ 1 (tree-max-depth ele))]
        )
      )
    tree)
  )
)


(display (tree-max-depth '(1 2))) (newline) ;; -> (2 3 4 5)
(display (tree-max-depth '(1 2 (3 4)))) (newline) ;; -> (2 3 4 5)


(define (tree-max-width tree)
    (foldl + 0
        (if (pair? tree)
            (list 1 (tree-max-width (cdr tree)))
            tree
        )
    )
)

;(display (tree-max-width '(3 (1 (4 1))))) (newline) ;; -> 2
;(display (tree-max-width '(3 1 (4 1)))) (newline) ;; -> 3
;(display (tree-max-width '(3 (1 4 1)))) (newline) ;; -> 2