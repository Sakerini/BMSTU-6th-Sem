(defun last_elem (lst)
  (cond
  ((null (cdr lst)) (car lst))
  (t (last_elem (cdr lst)))
  )
)

(print (last_elem '(1 2 (3))))