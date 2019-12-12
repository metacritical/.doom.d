;; Place your private configuration here
(load! "+keys") ; Load custom keymaps
(load! "+agenda")
(load! "+publish")
(load! "+graphviz")

(add-to-list 'org-babel-load-languages '(dot . t))
(add-to-list 'org-babel-load-languages '(plantuml . t))
(add-to-list 'org-babel-load-languages '(sql .t))
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)

(add-to-list 'org-latex-classes
          '("koma-article"
            "\\documentclass{scrartcl}
            \\usepackage{geometry}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
            marginparsep=7pt, marginparwidth=.6in}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



(add-to-list 'org-latex-classes
             '("djcb-org-article"
               "\\documentclass[11pt,a4paper]{article}
\\usepackage[T1]{fontenc}
\\usepackage{fontspec}
\\usepackage{graphicx}
\\defaultfontfeatures{Mapping=tex-text}
\\setromanfont{Gentium}
\\setromanfont [BoldFont={Gentium Basic Bold},
                ItalicFont={Gentium Basic Italic}]{Gentium Basic}
\\setsansfont{Charis SIL}
\\setmonofont[Scale=0.8]{DejaVu Sans Mono}
\\usepackage{geometry}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
            marginparsep=7pt, marginparwidth=.6in}
\\pagestyle{empty}
\\title{}
      [NO-DEFAULT-PACKAGES]
      [NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-to-pdf-process
  '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode %f")) ;; for multiple passes

;; Default Settings
(setq doom-font (font-spec :family "Fira Code" :size 26)
      doom-big-font (font-spec :family "Fira Code" :size 32)
      org-use-speed-commands t
      org-image-actual-width nil
      org-bullets-bullet-list '("✖" "✚")
      +org-export-directory "~/.export/")

(setq org-html-head "<link rel=\"stylesheet\" href=\"https://codepen.io/nmartin84/pen/JjoYrzP.css\" type=\"text/css\"/>"
      org-export-with-toc t
      org-export-with-author t
      org-export-headline-levels 5
      org-export-with-drawers t
      org-export-with-email t
      org-export-with-footnotes t
      org-export-with-latex t
      org-export-with-section-numbers nil
      org-export-with-properties t
      org-export-with-smart-quotes t)

(setq easy-hugo-helm-ag t
      easy-hugo-basedir "~/blog-static-files/"
      easy-hugo-url "https://nmartin84.github.io/blog/"
      easy-hugo-root "~/test"
      easy-hugo-previewtime "300")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)

(setq org-plantuml-jar-path "~/.emacs.d/bin/plantuml.jar")

(setq org-archive-location "~/.gtd/archive.org::datetree/"
      org-default-notes-file "~/.gtd/inbox.org"
      projectile-project-search-path '("~/"))

(setq org-directory (expand-file-name "~/.org/")
      org-archive-location "~/.gtd/archive.org::datetree/"
      org-default-notes-file "~/.gtd/inbox.org"
      projectile-project-search-path '("~/"))

(setq org-agenda-files '("~/.gtd/tasks/thelist.org" "~/.gtd/inbox/someday.org")
      org-agenda-diary-file '("~/.org/diary.org")
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t)

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm)

(setq org-log-state-notes-insert-after-drawers nil
      org-log-into-drawer t
      org-log-done 'note
      org-log-repeat 'time
      org-log-redeadline 'time
      org-log-reschedule 'time)

(setq org-tags-column -80
      org-tag-persistent-alist '(("@email" . ?e) ("@phone" . ?p) ("@work" . ?w) ("@personal" . ?l) ("@read" . ?r) ("@emacs" . ?E) ("@watch" . ?W) ("@computer" . ?c) ("@purchase" . ?P)))

(setq org-link-abbrev-alist
      '(("doom-repo" . "https://github.com/hlissner/doom-emacs/%s")
        ("wolfram" . "https://wolframalpha.com/input/?i=%s")
        ("duckduckgo" . "https://duckduckgo.com/?q=%s")
        ("gmap" . "https://maps.google.com/maps?q=%s")
        ("gimages" . "https://google.com/images?q=%s")
        ("google" . "https://google.com/search?q=")
        ("youtube" . "https://youtube.com/watch?v=%s")
        ("youtu" . "https://youtube.com/results?search_query=%s")
        ("github" . "https://github.com/%s")
        ("attach" . "~/org/.attach/")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "REVIEW(R!)" "PROJ(p!)" "NOTE(N!)" "NEXT(n!)" "DELEGATED(e!)" "SOMEDAY(l!)" "|" "INVALID(I!)" "DONE(d!)"))
      org-todo-keyword-faces
      '(("TODO" :foreground "tomato" :weight bold)
        ("PROJ" :foreground "dark orange" :weight bold)
        ("NOTE" :foreground "SteelBlue2" :weight bold)
        ("NEXT" :foreground "tomato" :weight bold)
        ("DELEGATED" :foreground "tomato" :weight bold)
        ("SOMEDAY" :foreground "yellow" :weight bold)
        ("DONE" :foreground "slategrey" :weight bold)))

(setq org-capture-templates
      '(("h" "Habit" entry (file+olp"~/.gtd/habits/habit.org" "Habits") ; Habit tracking in org agenda
         "* TODO %?\nSCHEDULED: <%<%Y-%m-%d %a +1d>>\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:LOGGING: DONE(!)\n:END:") ; Default scheduled for daily reminders (+1d) [you can change to weekly (+1w) monthly (+1m) or yearly (+1y) and auto-sets style to "HABIT" with Repeat state to "TODO".
        ("g" "Get Shit Done" entry (file+olp"~/.gtd/inbox/inbox.org" "Inbox") ; Sets all "Get Shit Done" captures to INBOX.ORG
         "* TODO %? %^g %^{CATEGORY}p\n:PROPERTIES:\n:CREATED: %U\n:END:")
        ("b" "Remember" entry (file+olp"~/.gtd/tasks/remember.org" "Inbox") ; Mark important items to remember
         "* NOTE %?")
        ("r" "Reference" entry (file"~/.references/inbox.org")
         "** NOTE %?")
        ("e" "Events" entry (file+olp+datetree"~/.gtd/notes/events.org")
         "* %?" :tree-type month)
        ("d" "Diary" entry (file+olp+datetree "~/.gtd/notes/diary.org")
         "** [%<%H:%M>] %?" :tree-type week)
        ("j" "Journal" entry (file+olp+datetree "~/.gtd/notes/journal.org")
         "** [%<%H:%M>] %?%^{ACCOUNT}p%^{SOURCE}p%^{AUDIENCE}p%^{TASK}p%^{TOPIC}p\n:PROPERTIES:\n:CREATED: <%<%Y-%m-%d>>\n:MONTH:    %<%b>\n:WEEK:     %<W%V>\n:DAY:      %<%a>\n:END:\n:LOGBOOK:\n:END:" :tree-type week :clock-in t :clock-resume t)))

(use-package deft
  :bind (("<f8>" . deft))
  :commands (deft deft-open-file deft-new-file-named)
  :config
  (setq deft-directory "~/.references/"
        deft-auto-save-interval 0
        deft-recursive t
        deft-extensions '("md" "txt" "org" "org.txt" "tex")
        deft-use-filter-string-for-filename nil
        deft-use-filename-as-title nil
        deft-markdown-mode-title-level 1
        deft-file-naming-rules '((noslash . "-")
                                 (nospace . "-")
                                 (case-fn . downcase))))

(global-auto-revert-mode t) ;; Auto revert files when file changes detected on disk
(add-to-list 'load-path  "~/.doom.d/modules/") ; Load plain-org-wiki .el module

;; Agenda Custom Commands
(after! org-agenda (setq org-super-agenda-mode t))
; Elfeed
(require 'elfeed)
(require 'elfeed-org)
(elfeed-org)
(after! org (setq rmh-elfeed-org-files (list "~/.elfeed/elfeed.org")
                  elfeed-db-directory "~/.elfeed/"))

(defun org-update-cookies-after-save()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (org-update-statistics-cookies "ALL")))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'org-update-cookies-after-save nil 'make-it-local)))

(defun my-agenda-prefix ()
  (format "%s" (my-agenda-indent-string (org-current-level))))

(defun my-agenda-indent-string (level)
  (if (= level 1)
      ""
    (let ((str ""))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "──")))
      (concat str "►"))))
