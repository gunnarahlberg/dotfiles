(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-js
                      starter-kit-lisp
                      ;; Clojure & friends
                      clojure-mode
                      nrepl
                      rainbow-delimiters
                      ;; Project navigation
                      projectile
                      ack-and-a-half
                      ;; Misc.
                      markdown-mode
                      twilight-theme
                      hlinum)
  "A list of packages to ensure are installed at launch.")

;; Automaticaly install any missing packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load the provided Clojure start kit configurations
(load (concat user-emacs-directory "clojure-starter-kit.el"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((t (:inherit nil :foreground "red" :background nil))))
 '(linum-highlight-face ((t (:inherit default :background "color-238" :foreground "white"))))
 '(show-paren-match ((((class color) (background dark)) (:inherit nil :foreground "red")))))

;; powerline - fancy line status bar line
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

;; twittermode - for fun
(add-to-list 'load-path "~/.emacs.d/vendor/twittering-mode")
(require 'twittering-mode)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Dropbox/orgmode/notes.org"))
(setq org-return-follow-link t)
(add-hook 'org-mode-hook 'djbc-count-words-connect)
(defun djcb-count-words-connect (local-set-key (kbd "<f11>") 'djcb-count-words))
(defun djcb-count-words (&optional begin end)
  "count words between BEGIN and END (region); if no region defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))

;; Pomodoro by Tomatinho
(require 'tomatinho)
(global-set-key (kbd "<f12>") 'tomatinho)
