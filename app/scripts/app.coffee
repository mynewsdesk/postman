EmberMail = window.EmberMail = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true


# Order and include as you please.
require 'scripts/models/*'
require 'scripts/controllers/*'
require 'scripts/store'
require 'scripts/routes/*'
require 'scripts/views/*'
require 'scripts/router'

Ember.Handlebars.registerBoundHelper 'prettyDate', (timestamp) ->
  moment.unix(timestamp).format('LLL')

