Postman.AdvanceSearchRoute = Ember.Route.extend
  model: (params)->
    params

  setupController: (controller, model) ->
    controller.set 'model', []
    controller.set 'loading', true
    filters = Postman.configs.customEventAttributes.map((attribute)->
      if model[attribute]
        property_name: attribute
        operator: "eq"
        property_value: model[attribute]
    ).filter (filter)->
      filter?

    Postman.KeenFetcher.data(
      timeframe: @controllerFor('application').get('timeframe')
      filters: filters

    ).then ((data) ->
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
    ), (reason) ->
      Postman.get('flash').alert(reason,"Keen Error");
      controller.set 'loading', false

    Postman.KeenFetcher.metric(
      analysisType: "count_unique"
      targetProperty: "email"
      groupBy: 'event'
      filters: filters
      timeframe: @controllerFor('application').get('timeframe')
    , false
    ).then (data)=>
      @controllerFor('advance').set 'advanceStats', data
