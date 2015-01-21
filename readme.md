# Quick CSS
### A Tiny Meteor Package for changing CSS on the fly

This package add a `<style>` element to the `<head>` of all pages, with contents that can be set using `quickCss.set 'body{background:red;}'` for example.

It uses a mongo collection to store the CSS data, so you don't need to edit your code in order to tweak CSS.

Unless you're using the `insecure` package, you'll need to `allow` updates to the collection on the server, eg: `quickCss.col.allow { update: -> true }`.

Quick CSS uses `meteorhacks:fastrender` to prevent CSS from flickering on first load (whist establishing DDP connection).

## TODO

* Tests
* LESS Support