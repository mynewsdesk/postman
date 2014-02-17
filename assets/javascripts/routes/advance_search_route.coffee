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
      timeframe: 'this_10_days'
      filters: filters
    ).then (data)=>
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
