EmberMail.ApplicationRoute = Ember.Route.extend
    # admittedly, this should be in IndexRoute and not in the
    # top level ApplicationRoute; we're in transition... :-)
    model: ->
      EmberMail.KeenFetcher.metric(analysisType: "count")
