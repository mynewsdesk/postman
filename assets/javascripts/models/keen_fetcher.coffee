Postman.KeenFetcher =
  time:
    previous_minutes: (minutes) ->
      parseInt(((new Date).getTime() / 1000) - minutes * 60, 10)
  metric: (options) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      Keen.onChartsReady ->
        metric = new window.Keen.Metric("Sendgrid Email Events", options)
        metric.getResponse (response) ->
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
        options.filters = JSON.stringify(options.filters)

        new Ember.$.getJSON(url, options).then (data) ->
          resolve(data)
    )
  series: (options) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      seriesOptions =
        analysisType: "count"
        timeframe: "previous_30_days"
        groupBy: "category"
        interval: "daily"
      $.extend seriesOptions, options
      Keen.onChartsReady ->
        serie = new window.Keen.Series("Sendgrid Email Events", seriesOptions)
        resolve serie
    )
