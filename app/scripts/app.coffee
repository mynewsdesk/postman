Postman = window.Postman = Ember.Application.create
  LOG_TRANSITIONS: false
  LOG_TRANSITIONS_INTERNAL: false
  configs: window.PostmanConfig


Ember.Handlebars.registerBoundHelper 'prettyDate', (timestamp) ->
  moment.unix(timestamp).format('YYYY-MM-DD HH:mm:ss')

$ ->
  $('body').tooltip
    selector: '[data-toggle=tooltip]'
    placement: 'right'
