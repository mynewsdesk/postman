Postman.EmailEventsRoute = Ember.Route.extend
  setupController: (controller, model) ->
    category = Postman.Category.from_url(model.category)
    controller.set 'model', []
    controller.set 'loading', true
    @controllerFor('application').set('category', category)

    emailModel = @controllerFor('email').get('model')
    filters = [
        property_name: "email"
        operator: "eq"
        property_value: emailModel.get('email')
      ,
        property_name: "category"
        operator: "eq"
        property_value: category.name
    ]

    Postman.KeenFetcher.data(
      timeframe: 'this_30_days'
      filters: filters
    ).then (data)=>
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
