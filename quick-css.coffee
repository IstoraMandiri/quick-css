# A bit of config
defaultCollectionId = 'main'

# Exported to project
quickCss =
  col: new Mongo.Collection '_quick_css'
  set: (css, _id='main') ->
    quickCss.col.upsert {_id: _id}, {$set: {css: css}}

# CLIENT ONLY
if Meteor.isClient

  # Start DDP Subscription
  Meteor.subscribe '_quick_css'

  # Create an empty <style> element
  $cssBox = $('<style>')
  # Append it to the head of the page
  $(document).ready ->
    $('head').append $cssBox

  # User tracker on quickCss.col and inject to head
  Deps.autorun ->
    $cssBox.html quickCss.col.findOne({_id: defaultCollectionId})?.css

# SERVER ONLY
if Meteor.isServer

  # Regular DDP publish
  Meteor.publish '_quick_css', ->
    quickCss.col.find({_id: defaultCollectionId})

  # Use Fastrender to inject quickCss subscription on all routes
  FastRender.onAllRoutes -> @subscribe '_quick_css'
