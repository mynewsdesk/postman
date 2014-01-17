EmberMail.ApplicationRoute = Ember.Route.extend
  model: ->
    EmberMail.KeenFetcher.metric(analysisType: "count")
