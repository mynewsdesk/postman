Postman.AdvanceSearchRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', []
    controller.set 'loading', true

    filters = [
        property_name: model.attribute
        operator: "eq"
        property_value: model.value
    ]

    Postman.KeenFetcher.data(
      timeframe: 'this_10_days'
      filters: filters
    ).then (data)=>
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
