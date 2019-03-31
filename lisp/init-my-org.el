


;MY ORGMODE SETTINGS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;;;; setup OrgMode

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;     (setq org-default-notes-file (concat org-directory "/notes.org"))
  ;;   (define-key global-map "\C-cc" 'org-capture)
     (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; my agenda files

;;(Setq org-agenda-files (list "C:/yong/GIT/git-notes/agenda/work.org"
;;                             "C:/yong/GIT/git-notes/agenda/learn.org"
;;                             "C:/yong/GIT/git-notes/agenda/journal.org"
;;                             "C:/yong/GIT/git-notes/agenda/defects.org"
;;                             "C:/yong/GIT/git-notes/agenda/home.org"))

(setq org-agenda-files '("~/Yong/git-notes/agenda/"))

(setq org-directory "~/Yong/git-notes/agenda/")
(setq org-default-notes-file (concat org-directory "work.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
  `(
    ("w" "Work" entry (file+datetree
		        ,(concat org-directory "work.org"))
	"* %^{Description} %^g %?
Added: %U")

    ("h" "Home" entry (file+datetree
		        ,(concat org-directory "home.org"))
        "* Topic: %^{Description}  %^g %?
Added: %U")


    ("l" "Learn" entry (file+datetree
		        ,(concat org-directory "learn.org"))
  "* Topic: %^{Description}  %^g %?
Added: %U")



   ("d" "Defects" entry (file+datetree
		        ,(concat org-directory "defects.org"))
  "** Topic: %^{Description}  %^g %")


    ("j" "Journal" entry (file+datetree
		        ,(concat org-directory "journal.org"))
  "* Topic: %^{Description}  %^g %?
Added: %U")
))



(setq org-agenda-todo-list-sublevels t)
;;;;; testing refiling taskes


; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
;;;;; test end


;;;;;;;; Publish Org Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; if the line below is actived, then the org-publish will regenerate all the org files.
;; otherwise, it will check the timestamp and regenerate only modified org files.


;;(setq org-publish-use-timestamps-flag nil)
;;(setq org-publish-use-timestamps-flag t)
(setq org-publish-use-timestamps-flag nil)


(setq org-publish-project-alist
    '(
      ("Git-note"
       :base-directory "~/Yong/git-notes"
       :publishing-directory "~/Yong/My Notes/Git-Notes"
       :auto-index t
       :index-title "index"
       :base-extension "org"
       :recursive t
       :publishing-function org-html-publish-to-html
       :headline-levels 5
       :section-numbers nil
       :auto-preamble t
       :auto-sitemap t                ; Generate sitemap.org automagically...
       :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
       :sitemap-title "Yong"
       :html-head    "<link rel=\"stylesheet\" type=\"text/css\" href=\"./styles/style.css\"/>"
     )



      ("note-static"
       :base-directory "~/Yong/git-notes"
       :publishing-directory "~/Yong/My Notes/Git-Notes"
       :recursive t
       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el\\|pptx\\|doc"
       :publishing-function org-publish-attachment)


;;        ("kronos-note"
;;       :base-directory "C:/yong/GIT/Knotes"
;;       :publishing-directory "C:/YONG/My Notes/knotes"
;;       :auto-index t
;;       :index-filename "Kronos_index.org"
;;       :index-title "index"
;;       :base-extension "org"
;;       :recursive t
;;       :publishing-function org-html-publish-to-html
;;       :html-link-home "file:///C:/YONG/My Notes/knotes/Kronos_index.html"
;;       :html-link-up "file:///C:/yong/My Notes/Git-Notes/index.html"
;;
;;       :headline-levels 5
;;       :section-numbers nil
;;       :auto-preamble t
;;       :auto-sitemap t                ; Generate sitemap.org automagically...
;;       :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
;;       :sitemap-title "Yong"
;;       :html-preamble "Yong's Notes"
;;         :html-head  "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.com/solarized-css/solarized-dark.min.css\"/>"
;;
;;
;;         )
;;
;;      ("note-static"
;;       :base-directory "C:/YONG/GIT/Notes/My Notes"
;;       :publishing-directory "C:/YONG/My Notes"
;;       :recursive t
;;       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
;;       :publishing-function org-publish-attachment)


    ("my-agenda"
       :base-directory "~/Yong/git-notes/agenda"
       :publishing-directory "~/Yong/My Notes/Git-Notes/agenda"
       :auto-index t
       :index-filename "work.org"
       :index-title "index"
       :base-extension "org"
       :recursive t
       :publishing-function org-html-publish-to-html
       :html-link-home "work.html"
       :html-link-up "sitemap.html"
       :headline-levels 5
       :section-numbers nil
       :auto-preamble t
       :auto-sitemap t                ; Generate sitemap.org automagically...
       :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
       :sitemap-title "Yong"
       :html-preamble "Yong's agenda"
         :html-head  "<link rel=\"stylesheet\" type=\"text/css\" href=\"C:/YONG/My Notes/css/solarized-light.css\"/>"


       )
      ("agenda-static"
       :base-directory "~/Yong/git-notes/agenda"
       :publishing-directory "~/Yong/My Notes/Git-Notes/agenda"
       :recursive t
       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
       :publishing-function org-publish-attachment)

      ("note"
       :components ("note-org" "note-static")
       :author "vincent.yongchen@gmail.com"
       )))





;; using org-bullets
;;http://cestlaz.github.io/posts/using-emacs-2-org/

(use-package org-bullets
   :ensure t
   :config
   (add-hook 'org-mode-hook (lambda() (org-bullets-mode 1))))



;;Clocking work time

     (setq org-clock-persist 'history)
     (org-clock-persistence-insinuate)

(provide 'init-my-org)
