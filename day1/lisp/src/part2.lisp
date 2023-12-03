(defpackage aoc1-lisp
  (:use :cl))
(in-package :aoc1-lisp)

(defvar *file* (alexandria:read-file-into-string "input.txt"))
(defvar *list* (uiop:split-string *file* :separator "
"))
(defvar *numstrs* '("one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
(defvar *nums* '("1" "2" "3" "4" "5" "6" "7" "8" "9"))
(defvar *value* 0)
(defvar the-first-num 0)
(defvar the-last-num 0)
(defvar cv 00)
(defvar pairs (pairlis *numstrs* *nums*))

(loop for string in *list* do 

         (let* ((first (find-if #'digit-char-p string))
                (last (find-if #'digit-char-p string :from-end t)))

           (setf lowest-pos (position first string :test #'string=))
           (setf highest-pos (position last string :test #'string= :from-end t))
           (setf the-first-num first)
           (setf the-last-num last)
           ;; (format t "~&~a" string)
           ;; (format t "~&First: ~a" first)
           ;; (format t "~&Last: ~a" last)
           (loop for num in *numstrs*
                 do (let* ((number-form (cdr
                                         (assoc num pairs
                                                :test #'string=)))
                           (first-str (search num string
                                                :test #'string=))
                           (last-str (search num string
                                               :test #'string=
                                               :from-end t)))
                      (if (numberp first-str)
                          (if (< first-str lowest-pos)
                              (block nums
                                (setf lowest-pos first-str)
                                (setf the-first-num number-form))))
                      (if (numberp last-str)
                          (if (> last-str highest-pos)
                              (block nums
                                (setf the-last-num number-form)
                                (setf highest-pos last-str))))
                      (setf cv (uiop:strcat the-first-num the-last-num))))

           ;; (format t "~&Nums: ~a ~a" the-first-num the-last-num)
           (setf *value* (+ *value* (parse-integer cv)))
           (format t "~&~a" *value*)))

(setf *value* 0)

;; blah blah blah.
