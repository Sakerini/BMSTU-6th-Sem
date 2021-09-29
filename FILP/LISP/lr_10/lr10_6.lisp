(defun modd (lst)
    (lastOdd lst nil)
)

(defun lastOdd (lst value)
    (cond 
        ((null lst) value)
        ((oddp (car lst)) (lastOdd (cdr lst) (car lst)))
        (t (lastOdd (cdr lst) value))
    )
)

(print (mOdd '(1 2 3 4 5)))