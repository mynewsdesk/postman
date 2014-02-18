Postman.StatsRoute = Ember.Route.extend
  setupController: (controller)->
    Postman.KeenFetcher.metric(
      analysisType: "select_unique"
      targetProperty: "category",
      timeframe: 'this_30_days'
    ).then (data)->
      if data.length
        controller.set 'categories', data.map (category)->
          Postman.Category.create name: category
