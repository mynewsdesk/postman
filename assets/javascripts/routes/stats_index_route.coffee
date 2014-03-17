Postman.StatsIndexRoute = Ember.Route.extend
  setupController: (controller)->
    @controllerFor('stats').set 'selectedCategory', null
    @controllerFor('stats').set 'stats', null
    Postman.Stats.metrics controller
    Postman.KeenFetcher.metric(
      analysisType: "count_unique"
      timeframe: @controllerFor('application').get('timeframe')
      targetProperty: "email"
      groupBy: "event"
    ).then (data)=>
      @controllerFor('stats').set 'stats', data
