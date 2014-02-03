Postman = window.Postman = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true

Ember.Handlebars.registerBoundHelper 'prettyDate', (timestamp) ->
  moment.unix(timestamp).format('YYYY-MM-DD HH:mm:ss')

