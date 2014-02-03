Postman.Email = Ember.Object.extend
  email: null
  category: null
  events: []
  loading: true
  number_of_events: (->
    @get('events').length
  ).property('events')
