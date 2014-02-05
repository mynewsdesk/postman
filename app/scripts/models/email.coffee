Postman.Email = Ember.Object.extend
  email: null
  categories: []
  loading: true

  init: ->
    console.log 'email init'
    Postman.KeenFetcher.metric(
      analysisType: "select_unique"
      targetProperty: "category",
      filters: [
        property_name: "email"
        operator: "eq",
        property_value: @get('email')
      ]
    ).then (data)=>
      @set 'categories', data
      @set 'loading', false

