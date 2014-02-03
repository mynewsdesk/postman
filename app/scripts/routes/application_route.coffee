Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
