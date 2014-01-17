EmberMail.EventRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set('model', EmberMail.Email.create(email: model.email, category: model.category));
    @controllerFor('application').set('email', model.email);
    @controllerFor('application').set('selected_category', model.category);


