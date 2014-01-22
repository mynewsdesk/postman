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
  data: (options) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      Keen.onChartsReady ->
        url = window.Keen.client.keenUrl +
                "/3.0/projects/" +
                window.Keen.client.projectId +
                "/queries/extraction"
        options.api_key = window.Keen.client.readKey
        options.event_collection = "Sendgrid Email Events"
        console.log options.filters
        options.filters = JSON.stringify(options.filters)
        options.latest = 30
        console.log options.filters

        new Ember.$.getJSON(url, options).then (data) ->
          resolve(data)
    )
