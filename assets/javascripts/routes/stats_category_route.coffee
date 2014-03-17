Postman.StatsCategoryRoute = Ember.Route.extend
  setupController: (controller, params)->
    category = Postman.Category.from_url(params.category)

    @controllerFor('stats').set 'stats', null
    Postman.Stats.metrics controller, category.name
    Postman.KeenFetcher.metric(
      analysisType: "count_unique"
      timeframe: @controllerFor('application').get('timeframe')
      targetProperty: "email"
      groupBy: "event"
      filters: [
        property_name: "category"
        operator: "eq"
        property_value: category.name
      ]
    ).then (data)=>
      @controllerFor('stats').set 'stats', data

