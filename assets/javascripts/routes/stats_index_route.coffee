Postman.StatsIndexRoute = Ember.Route.extend
  setupController: (controller)->
    @controllerFor('stats').set 'selectedCategory', null
    Postman.Stats.metrics controller
