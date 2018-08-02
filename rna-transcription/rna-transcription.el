;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:
(defun to-rna(dna)
  "converts a dna strand to a rna strand"
  (let* ((rna-chars (mapcar 'char-to-rna dna)))
    (concat rna-chars)))

(defun char-to-rna(char)
  (cond ((eq char ?G) ?C)
        ((eq char ?C) ?G)
        ((eq char ?T) ?A)
        ((eq char ?A) ?U)
        (t (error "Wrong dna"))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
