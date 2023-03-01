;; @see https://www.reddit.com/r/emacs/comments/ofhket/further_boost_start_up_time_with_a_simple_tweak/
;; 10% speed up of startup
(setq gc-cons-threshold most-positive-fixnum)

;; Inhibit resizing Puremacs frame
(setq frame-inhibit-implied-resize t)

;; To suppress flashing at startup
(setq-default inhibit-redisplay t
              inhibit-message t)
(add-hook 'after-init-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))

;; Package initialize occurs automatically, before user-init-file is
;; loaded, but after early-init-file. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

;; Disable site-run-file
(setq site-run-file nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
