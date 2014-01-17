EmberMail.KeenFetcher =
  time:
    previous_minutes: (minutes) ->
      parseInt(((new Date).getTime() / 1000) - minutes * 60, 10)
  metric: (options) ->
    console.log 'KeenFetcher.metric', options
    new Ember.RSVP.Promise((resolve, reject) ->
      Keen.onChartsReady ->
        metric = new window.Keen.Metric("Sendgrid Email Events", options)
        metric.getResponse (response) ->
          console.log(response.result)
          resolve response.result
    )
