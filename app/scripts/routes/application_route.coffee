Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set 'model', window.PostmanConfig.startNumber
    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
