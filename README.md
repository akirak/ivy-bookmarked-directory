# ivy-bookmarked-directory

This is an [Ivy](https://github.com/abo-abo/swiper) interface which displays a list of bookmarked directories.

There is `counsel-bookmark` command included in the counsel package, but `ivy-bookmarked-directory` is different in the following aspects:

- It displays only directory bookmarks.
- It displays bookmarked directories rather than bookmark names in the list.
- It cannot add/edit/delete a bookmark.

## Configuration

### Adding more actions

As `ivy-bookmarked-directory` is based on Ivy, you can [customize](http://oremacs.com/swiper/#customization) it.

For example, the following snippets adds an action to open a selected directory using `multi-term`:

``` emacs-lisp
(ivy-add-actions 'ivy-bookmarked-directory
                 '(("m" (lambda (cand)
                          (let ((default-directory cand))
                            (multi-term))) "multi-term")))
```

## Usage

Use `ivy-bookmarked-directory`.

## License

GPL v3
