quickCss =
  col: new Mongo.Collection '_quick_css'

  set: (css) ->
    quickCss.col.update {_id: 'main'},
      $set:
        css: css

if Meteor.isClient
  $cssBox = $('<style>')

  $(document).ready ->
    $('head').append $cssBox

  Deps.autorun ->
    $cssBox.html quickCss.col.findOne({_id:'main'})?.css

  Meteor.subscribe '_quick_css'

if Meteor.isServer

  Meteor.publish '_quick_css', ->
    quickCss.col.find({_id:'main'})

  FastRender.onAllRoutes ->
    @subscribe '_quick_css'

  unless quickCss.col.findOne('main')
    quickCss.col.insert
      _id: 'main'
      css: ''
