Package.describe({
  summary: "Simple Collection-Based CSS Editing",
  version: "0.1.0",
  name: 'hitchcott:quick-css',
  git: "https://github.com/hitchcott/quick-css"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1.0.2.1');
  api.use([
    'jquery'
  ], 'client')

  api.use([
    'deps',
    'mongo',
    'coffeescript',
    'meteorhacks:fast-render@2.2.0'
  ], ['client', 'server']);

  api.addFiles([
    'quick-css.coffee'
  ], ['client', 'server']);

  api.export('quickCss')
});