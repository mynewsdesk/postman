Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', 'millions'
    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
