
(defun reg-add (lst)
  (reg-add-recur lst 0)
)

(defun reg-add-recur (lst sum)
  (cond 
  ((null lst) sum)
  ((listp (car lst)) (reg-add-recur (car lst) (reg-add-recur (cdr lst) sum)))
  (t (reg-add-recur (cdr lst) (+ sum (car lst))))
  )
)

(print (reg-add '(1 5 (3 1) () 9)))