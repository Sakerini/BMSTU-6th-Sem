defun recnth_rec (n lst)
  (if (eq n 0) (car lst) (recnth_rec (- n 1) (cdr lst))
  )
)