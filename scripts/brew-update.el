;;; brew-update.el --- Update Homebrew formula  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(load-file "./scripts/_prepare.el")

(require 'github-tags)

(let* ((response (cdr (github-tags "emacs-eask/cli")))
       (tags (plist-get response :names))
       (latest (car tags))
       (version)
       (beg) (end))
  (with-current-buffer (find-file "Formula/eask-cli.rb")
    (goto-char (point-min))
    (when (search-forward "version " nil t)
      (when-let ((beg (1+ (point)))
                 (end (1- (line-end-position)))
                 (version (buffer-substring beg end))
                 (_ (not (string= version latest)))
                 (new-content (string-replace version latest (buffer-string))))
        (erase-buffer)
        (insert new-content)
        (save-buffer)
        (message "[INFO] Update Eask CLI to latest version %s" latest)))))

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; brew-update.el ends here
