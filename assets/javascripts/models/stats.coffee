Postman.Stats =
  metrics: (controller, category) ->
    filtersGenerator = (eventName, categoryName)->
      filters = [
        property_name: "event"
        operator: "eq"
        property_value: eventName
      ]
      filters = filters.concat(
        property_name: "category"
        operator: "eq"
        property_value: categoryName
      ) if categoryName?
      filters


    Postman.KeenFetcher.series(
      filters: filtersGenerator "bounce", category
      timeframe: controller.controllerFor('application').get('timeframe')
    ).then (series)->
      controller.set 'bounces', series

    Postman.KeenFetcher.series(
      filters: filtersGenerator "delivered", category
      timeframe: controller.controllerFor('application').get('timeframe')
    ).then (series)->
      controller.set 'delivered', series

    Postman.KeenFetcher.series(
      filters: filtersGenerator "open", category
      timeframe: controller.controllerFor('application').get('timeframe')
    ).then (series)->
      controller.set 'open', series

    Postman.KeenFetcher.series(
      filters: filtersGenerator "click", category
      timeframe: controller.controllerFor('application').get('timeframe')
    ).then (series)->
      controller.set 'click', series

    Postman.KeenFetcher.series(
      filters: filtersGenerator "dropped", category
      timeframe: controller.controllerFor('application').get('timeframe')
    ).then (series)->
      controller.set 'dropped', series
