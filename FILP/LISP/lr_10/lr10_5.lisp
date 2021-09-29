(defun sum_all (lst n)
  (sum_all_rec lst n 0)
)

(defun sum_all_rec (lst n sum)
  (cond
  ((or (null lst) (eq n 0)) sum)
  (t (sum_all_rec (cdr lst) (- n 1) (+ sum (car lst))))
  )
)

(print (sum_all '(1 2 3 4 5) 10))