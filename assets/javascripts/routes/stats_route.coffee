Postman.StatsRoute = Ember.Route.extend
  setupController: (controller)->
    Postman.KeenFetcher.metric(
      analysisType: "select_unique"
      targetProperty: "category",
      timeframe: @controllerFor('application').get('timeframe')
    ).then (data)->
      if data.length
        controller.set 'categories', data.map (category)->
          Postman.Category.create name: category
