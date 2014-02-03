Postman.Email = Ember.Object.extend
  email: null
  category: null
  events: []
  loading: true
  number_of_events: (->
    @get('events').length
  ).property('events')


  init: ->
    # filters = [
    #     property_name: "email"
    #     operator: "eq",
    #     property_value: @get('email')
    # ]
    # filters.unshift(
    #   property_name: "category"
    #   operator: "eq",
    #   property_value: @get('category')
    # ) unless @get('category') == 'all'

    # Postman.KeenFetcher.data(
    #   filters: filters
    # ).then (data)=>
    #   console.log('model keen data', data)
    #   @set 'events', data.result
    #   @set 'loading', false
