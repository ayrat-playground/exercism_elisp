;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:

(defun etl(hash)
  "Transforms old data to new form"
  (let ((result (make-hash-table)))
    (maphash (lambda (k values)
               (if (< k 0) (error "Key is smaller than zero"))
               (mapc (lambda(value)
                       (if (not (stringp value)) (error "Value is not a string"))
                       (puthash (downcase value) k result)) values)) hash)
    result))

(provide 'etl)
;;; etl.el ends here
