(defun between (from to lst)
    (remove nil (mapcar #'(lambda (x) (if (<= x to) (if (>= x from) x))) lst))
)

(defun between_rec(from to lst)
    (cond ((equal (cdr lst) Nil) (cond ((and (>= (car lst) from)(<= (car lst) to) (cons (car lst) nil)))(T Nil)))
          (T (cond 
            ((and (>= (car lst) from)(<= (car lst) to))(cons (car lst) (between_rec from to (cdr lst))))
            (T (between_rec from to (cdr lst)))
            )
          )
    )
)
(print (between 1 10 '(4 12 2 31 5)))