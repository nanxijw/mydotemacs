;; @see https://www.reddit.com/r/emacs/comments/ofhket/further_boost_start_up_time_with_a_simple_tweak/
;; 10% speed up of startup
(setq gc-cons-threshold most-positive-fixnum)

;; Package initialize occurs automatically, before user-init-file is
;; loaded, but after early-init-file. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

;; Every file opened and loaded by Emacs will run through this list to
;; check for a proper handler for the file, but during startup, it
;; won’t need any of them.
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Disable site-run-file
(setq site-run-file nil)

(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
