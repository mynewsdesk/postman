Postman.EmailEventsRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', []
    controller.set 'loading', true

    emailModel = @controllerFor('email').get('model')
    filters = [
        property_name: "email"
        operator: "eq",
        property_value: emailModel.get('email')
    ]
    filters.unshift(
      property_name: "category"
      operator: "eq",
      property_value: Postman.Category.from_url(model.category).name
    ) unless model.category == 'all'

    Postman.KeenFetcher.data(
      filters: filters
    ).then (data)=>
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
