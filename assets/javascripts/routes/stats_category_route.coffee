Postman.StatsCategoryRoute = Ember.Route.extend
  setupController: (controller, params)->
    Postman.Stats.metrics controller, Postman.Category.from_url(params.category).name
