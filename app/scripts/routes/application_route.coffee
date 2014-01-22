EmberMail.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    EmberMail.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
