Postman.AdvanceIndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('advance').set 'advanceStats', null
