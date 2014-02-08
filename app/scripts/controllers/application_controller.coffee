Postman.ApplicationController = Ember.ObjectController.extend
  email: null
  category: null
  actions:
    search: ->
      @transitionToRoute 'email', email: @get('email')
