;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(defun anagrams-for(word anagrams)
  "Finds anagrams"
  (let ((word-len (length word))
        (chars (mapcar `char-to-string word)))
    (reverse (add-anagrams word anagrams ()))))

(defun add-anagrams(word words result)
  "Iterates words finding anagrams for word"
  (if (eq words '()) result
    (let ((current-word (car words))
          (tail (cdr words)))
      (if (anagramsp word current-word) (add-anagrams word tail (cons current-word result))
        (add-anagrams word tail result)))))

(defun anagramsp(word1 word2)
  "Checks if two words are anagrams"
  (let* ((chars1 (mapcar `char-to-string (downcase word1)))
         (chars2 (mapcar `char-to-string (downcase word2)))
         (count1 (chars-count chars1 chars1 '()))
         (count2 (chars-count chars2 chars2 '())))
    (if (and (not (string= word1 word2)) (eq (length count1) (length count2)))
        (chars-match count1 count2 t))))

(defun chars-match(count1 count2 result)
  (if (or (not result) (not count2)) result
    (chars-match count1 (cdr count2) (and (member (car count2) count1) result))))

(defun chars-count(chars current-chars result)
  "Counts the numbers of occurences of each char in word"
  (if (or (eq current-chars nil) (eq current-chars '())) (delete-dups result)
    (let* ((current-char (car current-chars))
          (count (cons (count-chars chars current-char 0) '())))
      (chars-count chars (cdr current-chars) (cons (cons current-char count) result)))))

(defun count-chars(chars char result)
  (if (or (eq chars nil) (eq chars `())) result
    (if (string= (car chars) char) (count-chars (cdr chars) char (+ 1 result))
      (count-chars (cdr chars) char result))))


(provide 'anagram)
;;; anagram.el ends here
