Postman.Email = Ember.Object.extend
  email: null
  categories: []
  loading: true
  not_found: false

  init: ->
    Postman.KeenFetcher.metric(
      analysisType: "select_unique"
      targetProperty: "category",
      filters: [
        property_name: "email"
        operator: "eq",
        property_value: @get('email')
      ]
      timeframe: 'this_30_days'
    ).then (data)=>
      if data.length
        @set 'categories', data.map (category)->
          Postman.Category.create name: category
      else
        @set 'not_found', true
      @set 'loading', false
