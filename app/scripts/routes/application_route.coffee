Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', 1000000
    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
