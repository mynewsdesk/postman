EmberMail.KeenFetcher =
  metric: (options) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      Keen.onChartsReady ->
        metric = new window.Keen.Metric("Sendgrid Email Events", options)
        metric.getResponse (response) ->
          console.log(response.result)
          resolve response.result
    )
