(defun square_all (lst)
    (cond 
    ((null lst) nil)
    (t (cons (* (car lst) (car lst)) (square_all (cdr lst))))
    )
)

(print (square_all '(1 2 3)))