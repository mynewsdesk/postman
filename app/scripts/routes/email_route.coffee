Postman.EmailRoute = Ember.Route.extend
  setupController: (controller, model)->
    if !controller.get('model') || controller.get('model').email != model.email
      controller.set('model', Postman.Email.create(email: model.email))
      @controllerFor('application').set('email', model.email)
      @controllerFor('application').set('category', null)


