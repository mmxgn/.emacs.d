					; list of packages to be installed
(setq package-list '(undo-tree plantuml-mode magit markdown-mode
			       use-package lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode ;; C/C++ IDE 
			       ))

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

					; Helm is for incremental completions - Sample config
					; https://github.com/emacs-helm/helm/ for details
(helm-mode)
(use-package helm-lsp
  :after helm
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

					; C/C++ IDE Related
;; Requirements:
;; Install bear
;; >> sudo pacman -S bear
;; More info: https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast


(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))



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
   '(use-package dap-mode helm-xref which-key company flycheck projectile helm-lsp lsp-treemacs yasnippet lsp-mode markdown-mode magit plantuml-mode undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

