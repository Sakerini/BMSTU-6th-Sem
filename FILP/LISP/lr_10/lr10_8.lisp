(defun select-odd (lst)
  (remove nil (select-odd-recur lst))
)

(defun select-odd-recur (lst)
  (cond
  ((null lst) nil)
  (t (cons (if (oddp (car lst)) (car lst) Nil) (select-odd-recur (cdr lst))))
  )
)

(print (select-odd '(1 2 3)))