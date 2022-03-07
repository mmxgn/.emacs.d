					; list of packages to be installed
(setq package-list '(undo-tree plantuml-mode magit markdown-mode))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

					; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

					; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

					; Initialize plantuml
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))


					; UI-related
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

					; Theme
(setq org-src-fontify-natively t)

					; Get an undo tree
(undo-tree-mode)

					; Recentf-mode - Show recently used files using C-x r
(recentf-mode)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
					; Global visual line mode - Wrap words
(global-visual-line-mode 1)
					; Highlight parentheses and other characters
(show-paren-mode 1)

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t) (plantuml . t))
 )

(add-to-list 'load-path "~/.emacs.d/lisp/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(markdown-mode magit plantuml-mode undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

