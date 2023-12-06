(defpackage day3
  (:use :cl :iterate :serapeum :str))
(in-package :day3)

(defvar input (alexandria:read-file-into-string #p"../../input.txt"))
(defvar lines (str:lines input))

(deftype value () '(member :empty :symbol :num))

(defstruct num
  (x 0 :type integer)
  (y 0 :type integer)
  (value :empty :type value))

(setf value-list '())

(iter (for line in lines)
  (generate index from 0)
  (let ((index (next index)))
    (iter (for char in (coerce line 'list))
      (uiop:println char)
      (generate i from 0)
      (when (string= "." char)
        (push (make-num :x (next i) :y index) value-list))
      (when (digit-char-p char)
        (push (make-num :x (next i) :y index :value :num ) value-list))
      (when (and (not (string= "." char)) (not (digit-char-p char)))
        (push (make-num :x (next i) :y index :value :symbol) value-list)))))

;; Useful for filtering list
;; :when (str:starts-with? "4" line)

;; This time I'm trying with the iterate macro functions instead of loop.

;; blah blah blah.
