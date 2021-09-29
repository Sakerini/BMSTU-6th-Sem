(defun last_el (lst)
    (if (null lst)
        Nil
        (reduce #'(lambda (_ el) el) lst)
    )
)

(print (last_el ())) ;;; Nil
(print (last_el '(1 2 3 4 5))) ;;; 5

(defun last_el_r (lst)
    (cond
        ((null lst) Nil)
        ((eql (length lst) 1) (car lst))
        (T (last_el_r (cdr lst)))
    )
)

(print (last_el_r ())) ;;; Nil
(print (last_el_r '(1 2 3 4 5))) ;;; 5