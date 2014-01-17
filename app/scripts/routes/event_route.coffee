EmberMail.EventRoute = Ember.Route.extend(
  model: (params) ->
    EmberMail.Email.create(email: params.email, category: params.category)
)

