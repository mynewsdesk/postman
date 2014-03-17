Postman.EmailRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'loading', true
    controller.set 'notFound', false
    emailModel = Postman.Email.create(email: model.email)
    controller.set 'model', emailModel
    @controllerFor('application').set('email', model.email)
    @controllerFor('application').set('category', null)

    Postman.KeenFetcher.metric(
      analysisType: "select_unique"
      targetProperty: "category"
      filters: [
        property_name: "email"
        operator: "eq",
        property_value: emailModel.get('email')
      ]
      timeframe: @controllerFor('application').get('timeframe')
    ).then (data)=>
      if data.length
        emailModel.set 'categories', data.map (category)->
          Postman.Category.create name: category
      else
        controller.set 'notFound', true
      controller.set 'loading', false



