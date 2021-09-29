(defun mult_num (lst k)
	(mapcar 
		#'(lambda (el) (* el k))
		lst
	)
)

(defun mult_all (lst k)
	(mapcar #'(lambda (el)
		(cond
			(
				(numberp el)
				(* el k)
			)
			(
				(atom el)
				el
			)
			(
				(mult_all el k)
			)
		)
	  ) lst
	)
)