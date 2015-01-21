# Quick CSS
### A Meteor Package for FastRendering Collection-Based CSS Injection

This package injects a `<style>` element to the `<head>` of all pages, with contents that can be set using `quickCss.set('body { background: red; } /* example css */')`.


It uses a mongo collection to store the CSS data, so you can edit your CSS directly in-app without refreshing the clients.

Unless you're using the `insecure` package, you'll need to `allow` updates to the collection on the server, eg: `quickCss.col.allow { update: -> isAdmin() }`.

Quick CSS uses `meteorhacks:fastrender` to prevent CSS from flickering on first load, even between refreshes (at least on Chrome).

## Quick Demo

http://quick-css.meteor.com/


## TODO

* Tests
* LESS Support

## MAYBE

* Route-based CSS, IR Integration
* UI