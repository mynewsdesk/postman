Postman.EmailsIndexController = Ember.ObjectController.extend
  email: null
  actions:
    search: ->
      @transitionToRoute 'email', email: @get('email')
