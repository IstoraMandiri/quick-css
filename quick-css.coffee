# A bit of config
defaultCollectionId = 'main'

# Exported to project
quickCss =
  col: new Mongo.Collection '_quick_css'
  # Write css to mongo
  set: (css, _id=defaultCollectionId) ->
    quickCss.col.update {_id: _id}, {$set: {css: css}}
  # Fetch css from mongo
  get: (_id=defaultCollectionId) ->
    quickCss.col.findOne({_id: _id})?.css

# CLIENT ONLY
if Meteor.isClient

  # Start DDP Subscription
  Meteor.subscribe '_quick_css'

  # Create an empty <style> element
  $cssBox = $ '<style id="_quick_css">'
  # Append it to the head of the page
  .appendTo 'head'

  # User tracker on quickCss.col and inject to head
  Deps.autorun ->
    $cssBox.html quickCss.get()

# SERVER ONLY
if Meteor.isServer

  # Regular DDP publish
  Meteor.publish '_quick_css', ->
    quickCss.col.find()

  # Use Fastrender to inject quickCss subscription on all routes
  FastRender.onAllRoutes -> @subscribe '_quick_css'

  # create default document on first load
  unless quickCss.get()
    quickCss.col.insert {_id:defaultCollectionId}
