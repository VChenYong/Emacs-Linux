;;; forge-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "forge" "forge.el" (23713 2410 505810 740000))
;;; Generated autoloads from forge.el

(with-eval-after-load 'magit-mode (define-key magit-mode-map "'" 'forge-dispatch))

;;;***

;;;### (autoloads nil "forge-commands" "forge-commands.el" (23713
;;;;;;  2410 501810 745000))
;;; Generated autoloads from forge-commands.el
 (autoload 'forge-dispatch "forge-commands" nil t)

(autoload 'forge-pull "forge-commands" "\
Pull topics from the forge repository.

With a prefix argument and if the repository has not been fetched
before, then read a date from the user and limit pulled topics to
those that have been updated since then.

If pulling is too slow, then also consider setting the Git variable
`forge.omitExpensive' to `true'.

\(fn &optional REPO UNTIL)" t nil)

(autoload 'forge-pull-notifications "forge-commands" "\
Fetch notifications for all repositories from the current forge.

\(fn)" t nil)

(autoload 'forge-pull-pullreq "forge-commands" "\
Pull a single pull-request from the forge repository.
Normally you wouldn't want to pull a single pull-request by
itself, but due to a bug in the Github API you might sometimes
have to do so.  See https://platform.github.community/t/7284.

\(fn PULLREQ)" t nil)

(autoload 'forge-browse-dwim "forge-commands" "\
Visit a topic, branch or commit using a browser.
Prefer a topic over a branch and that over a commit.

\(fn)" t nil)

(autoload 'forge-browse-commit "forge-commands" "\
Visit the url corresponding to REV using a browser.

\(fn REV)" t nil)

(autoload 'forge-copy-url-at-point-as-kill "forge-commands" "\
Copy the url of the thing at point.

\(fn)" t nil)

(autoload 'forge-browse-branch "forge-commands" "\
Visit the url corresponding BRANCH using a browser.

\(fn BRANCH)" t nil)

(autoload 'forge-browse-remote "forge-commands" "\
Visit the url corresponding to REMOTE using a browser.

\(fn REMOTE)" t nil)

(autoload 'forge-browse-topic "forge-commands" "\
Visit the current topic using a browser.

\(fn)" t nil)

(autoload 'forge-browse-pullreqs "forge-commands" "\
Visit the url corresponding to REPO's pull-requests using a browser.

\(fn REPO)" t nil)

(autoload 'forge-browse-pullreq "forge-commands" "\
Visit the url corresponding to PULLREQ using a browser.

\(fn PULLREQ)" t nil)

(autoload 'forge-browse-issues "forge-commands" "\
Visit the url corresponding to REPO's issues using a browser.

\(fn REPO)" t nil)

(autoload 'forge-browse-issue "forge-commands" "\
Visit the url corresponding to ISSUE using a browser.

\(fn ISSUE)" t nil)

(autoload 'forge-browse-post "forge-commands" "\
Visit the url corresponding to the post at point using a browser.

\(fn)" t nil)

(autoload 'forge-visit-topic "forge-commands" "\
View the topic at point in a separate buffer.

\(fn)" t nil)

(autoload 'forge-visit-pullreq "forge-commands" "\
View the pull-request at point in a separate buffer.

\(fn PULLREQ)" t nil)

(autoload 'forge-visit-issue "forge-commands" "\
View the issue at point in a separate buffer.

\(fn ISSUE)" t nil)

(autoload 'forge-branch-pullreq "forge-commands" "\
Create and configure a new branch from a pull-request.
Please see the manual for more information.

\(fn PULLREQ)" t nil)

(autoload 'forge-checkout-pullreq "forge-commands" "\
Create, configure and checkout a new branch from a pull-request.
Please see the manual for more information.

\(fn PULLREQ)" t nil)

(autoload 'forge-checkout-worktree "forge-commands" "\
Create, configure and checkout a new worktree from a pull-request.
This is like `magit-checkout-pull-request', except that it
also creates a new worktree. Please see the manual for more
information.

\(fn PATH PULLREQ)" t nil)

(autoload 'forge-list-notifications "forge-commands" "\
List notifications.

\(fn)" t nil)

(autoload 'forge-add-pullreq-refspec "forge-commands" "\
Configure Git to fetch all pull-requests.
This is done by adding \"+refs/pull/*/head:refs/pullreqs/*\"
to the value of `remote.REMOTE.fetch', where REMOTE is the
upstream remote.  Also fetch from REMOTE.

\(fn)" t nil)

(autoload 'forge-remove-repository "forge-commands" "\
Remove a repository from the database.

\(fn REPO)" t nil)

(autoload 'forge-reset-database "forge-commands" "\
Move the current database file to the trash.
This is useful after the database scheme has changed, which will
happen a few times while the forge functionality is still under
heavy development.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "forge-list" "forge-list.el" (23713 2410 509810
;;;;;;  735000))
;;; Generated autoloads from forge-list.el

(autoload 'forge-list-issues "forge-list" "\
List issues in a separate buffer.

\(fn REPO)" t nil)

(autoload 'forge-list-pullreqs "forge-list" "\
List pull-requests in a separate buffer.

\(fn REPO)" t nil)

;;;***

;;;### (autoloads nil nil ("forge-bitbucket.el" "forge-core.el" "forge-db.el"
;;;;;;  "forge-gitea.el" "forge-github.el" "forge-gitlab.el" "forge-gogs.el"
;;;;;;  "forge-issue.el" "forge-notify.el" "forge-pkg.el" "forge-post.el"
;;;;;;  "forge-pullreq.el" "forge-repo.el" "forge-revnote.el" "forge-semi.el"
;;;;;;  "forge-topic.el") (23713 2410 517810 724000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; forge-autoloads.el ends here
