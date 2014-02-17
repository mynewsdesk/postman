Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', Postman.configs.startNumber
    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data

# Postman.IndexRoute = Ember.Route.extend
#   beforeModel: ->
#     @transitionTo('emails')
