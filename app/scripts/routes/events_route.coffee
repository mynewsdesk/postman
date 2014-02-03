Postman.EmailEventsRoute = Ember.Route.extend
  setupController: (controller, email) ->
    controller.set 'model', []
    controller.set 'loading', true
    model = @controllerFor('email').get('model')
    # controller.set 'model', [{title: "high"},{title: "five"}]

    filters = [
        property_name: "email"
        operator: "eq",
        property_value: model.get('email')
    ]
    filters.unshift(
      property_name: "category"
      operator: "eq",
      property_value: model.get('category')
    ) unless model.get('category') == 'all'

    Postman.KeenFetcher.data(
      filters: filters
    ).then (data)=>
      console.log('model keen data', data)
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
