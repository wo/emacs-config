;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.
;;
;; WARNING: Disabling core packages listed in ~/.emacs.d/core/packages.el may
;; have nasty side-effects and is not recommended.


;; All of Doom's packages are pinned to a specific commit, and updated from
;; release to release. To un-pin all packages and live on the edge, do:
;(unpin! t)

;; ...but to unpin a single package:
;(unpin! pinned-package)
;; Use it to unpin multiple packages
;(unpin! pinned-package another-pinned-package)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;(package! org :pin "5890ac")

(package! olivetti)
(package! org-super-agenda)
;(package! org-clock-convenience)
;(package! anki-editor)
(package! org-fragtog) ; auto-toggle latex previews
(package! cdlatex)
(package! embark)
(package! embark-consult)
;; (package! consult-org-roam) ; search notes
;; (package! math-symbol-lists :disable t)
;; (use-package! math-symbol-lists
;;   :load-path "~/doom.d/my-math-symbols.el")
;; (package! memoize)
(package! org-contacts)
(unpin! org-roam)
;; (package! org-ref)
;;(package! org-roam-bibtex
;;  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;;(unpin! org-roam company-org-roam)
;; (package! citar)
;; (package! citar-embark)

; temporary hack to make org-roam work 01/25:
; https://org-roam.discourse.group/t/solved-emasql-error-in-doom-emacs/3680/2
(package! emacsql :pin "b84102f")

(package! org-wild-notifier)

;; (package! helm-org-contacts
;;   :recipe (:host github :repo "tmalsburg/helm-org-contacts"))

; nicer typography:
;; (package! typo)

; choose spell-checker based on current language:
;; (package! guess-language)

; show outline next to text:
;; (package! org-sidebar)

; chatgpt:
(package! gptel)

; github copilot:
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el" "dist")))


; current powerthesaurus version in doom throws 403:
(unpin! powerthesaurus)
(package! powerthesaurus
 :recipe (:host github :repo "SavchenkoValeriy/emacs-powerthesaurus"))



;; (package! org-cite-csl-activate
;;   :recipe (:host github :repo "andras-simonyi/org-cite-csl-activate") :pin "9e68d9204469c674f49a20bdf7ea85da4f4bf720")

;; (package! khoj
;;   :recipe (:host github :repo "khoj-ai/khoj" :files (:defaults "src/interface/emacs/khoj.el")))

; auto-activating snippets
;; (package! aas :recipe (:host github :repo "ymarco/auto-activating-snippets")
;;   :pin "e92b5cffa4e87c221c24f3e72ae33959e1ec2b68")

;; (use-package! aas
;;   :commands aas-mode)

(package! org-appear :recipe (:host github :repo "awth13/org-appear"))

;   :pin "eb9f9db40aa529fe4b977235d86494b115281d17")
;;(package! org-appear :recipe (:local-repo "/home/wo/programming/org-appear"))





;; (package! ws-butler :disable t)
(package! mu4e-alert :disable t)
;; (package! mu4e-contrib)

