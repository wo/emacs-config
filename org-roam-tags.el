;;; ~/.doom.d/org-roam-tags.el -*- lexical-binding: t; -*-

(defun +org-roam-tags-read ()
  "Return list of tags as set in the buffer."
  (org-roam--extract-tags-prop (buffer-file-name (buffer-base-buffer))))

(defun +org-roam-tags-delete ()
  "Delete a tag from current note."
  (interactive)
  (unless (+org-roam-buffer-p)
    (user-error "Current buffer is not a note"))
  (let* ((tags (+org-roam-tags-read))
         (tag (completing-read "Tag: " tags nil 'require-match)))
    (+org-buffer-prop-set
     "ROAM_TAGS"
     (combine-and-quote-strings (delete tag tags)))
    (org-roam-db--update-tags)))

(defun +org-roam-tags-add ()
  "Add a tag to current note."
  (interactive)
  (unless (+org-roam-buffer-p)
    (user-error "Current buffer is not a note"))
  (let* ((tags (seq-uniq
                (+seq-flatten
                 (+seq-flatten
                  (org-roam-db-query [:select tags :from tags])))))
         (tag (completing-read "Tag: " tags)))
    (when (string-empty-p tag)
      (user-error "Tag can't be empty"))
    (+org-buffer-prop-set
     "ROAM_TAGS"
     (combine-and-quote-strings (seq-uniq (cons tag (+org-roam-tags-read)))))
    (org-roam-db--update-tags)))

(defun +org-roam-buffer-p ()
  "Return non-nil if the currently visited buffer is a note."
  (and buffer-file-name
       (string-equal (expand-file-name (file-name-as-directory org-roam-directory))
                     (file-name-directory buffer-file-name))))

(defun +seq-flatten (list-of-lists)
  "Flatten LIST-OF-LISTS."
  (apply #'append list-of-lists))

(defun +org-buffer-prop-set (name value)
  "Set a buffer property called NAME to VALUE."
  (save-excursion
    (widen)
    (goto-char (point-min))
    (if (re-search-forward (concat "^#\\+" name ": \\(.*\\)") (point-max) t)
        (replace-match (concat "#+" name ": " value))
      ;; find the first line that doesn't begin with ':' or '#'
      (let ((found))
        (while (not (or found (eobp)))
          (beginning-of-line)
          (if (or (looking-at "^#")
                  (looking-at "^:"))
              (line-move 1 t)
            (setq found t)))
        (insert "#+" name ": " value "\n")))))
