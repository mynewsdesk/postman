Postman = window.Postman = Ember.Application.create
  LOG_TRANSITIONS: false
  LOG_TRANSITIONS_INTERNAL: false

Ember.Handlebars.registerBoundHelper 'prettyDate', (timestamp) ->
  moment.unix(timestamp).format('YYYY-MM-DD HH:mm:ss')

