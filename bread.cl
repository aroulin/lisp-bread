(defun grams (x) x)
(defun ml (x) x)
(defun tsp (x) x)

(defun minutes (x) x)
(defun hours (x) (* x 60))
(defun minutes-to-hours (x) `(hours ,(/ (eval x) 60)))

(defparameter *day-names*
    '("Monday" "Tuesday" "Wednesday"
      "Thursday" "Friday" "Saturday"
      "Sunday"))

(defun print-time (time)
    (multiple-value-bind
    (second minute hour date month year day-of-week)
    (decode-universal-time time)
    (format t "will be done at ~2,'0d:~2,'0d:~2,'0d of ~a, ~d/~2,'0d/~d"
          hour
          minute
          second
          (nth day-of-week *day-names*)
          month
          date
          year)))

(defun time-to-finish-recipe (recipe)
    "return total time to finish given recipe"
    (time-add-from-now (total-time recipe)))

(defun time-add-from-now (time)
    "Add given time to current time"
    (multiple-value-bind
        (second minute hour date month year)
        (get-decoded-time)
    (let ((new-time (encode-universal-time second (+ minute (mod (eval time) 60)) (+ hour (/ (eval time) 60)) date month year)))
      (print-time new-time))))

(defun ingredients (recipe)
    (cdr (assoc 'ingredients recipe)))

(defun steps (recipe)
    (cdr (assoc 'steps recipe)))

(defun step-description (step)
    (cadddr step))

(defun time-of-step (step)
    (eval (car (cddr step))))

(defun total-time-from-step (step)
    (if step
    (+ (time-of-step (car step)) (total-time-from-step (cdr step)))
    0))

(defun total-time (recipe)
    `(minutes ,(total-time-from-step (steps recipe))))

(defun describe-ingredient (ingredient)
    `(,(eval (cadr ingredient)) ,(caadr ingredient) of ,(car ingredient)))

(defun describe-with-ingredients (step-description recipe)
    (if step-description
        (let* ((word (car step-description)) (ingredient (assoc word (ingredients recipe))))
            (cond (ingredient
                (cons (describe-ingredient ingredient) (describe-with-ingredients (cdr step-description) recipe)))
                (t (cons (car step-description) (describe-with-ingredients (cdr step-description) recipe)))))))

(defun describe-step (step-name recipe)
    (let ((step (assoc step-name (steps recipe))))
        (describe-with-ingredients (step-description step) recipe)))

(defun describe-recipe-from-step (step recipe)
    (if step
        (cons `(,(caar step) ,(describe-step (caar step) recipe)) (describe-recipe-from-step (cdr step) recipe))))

(defun describe-recipe (recipe)
    (describe-recipe-from-step (steps recipe) recipe))

(defun factor-ingredient-by (ingredient x)
    `(,(car ingredient) (,(caadr ingredient) ,(* x (eval (cadadr ingredient))))))

(defun factor-ingredients-by (ingredients x)
    (if ingredients
        (cons (factor-ingredient-by (car ingredients) x) (factor-ingredients-by (cdr ingredients) x))))

(defun factor-recipe-by (recipe x)
    (cons (cons `ingredients (factor-ingredients-by (ingredients recipe) x)) (cdr recipe)))
