EmberMail.Email = Ember.Object.extend
  email: null
  category: null
  number_of_events: null

  init: ->
    EmberMail.KeenFetcher.metric(
      analysisType: "count",
      filters: [
        property_name: "email"
        operator: "eq",
        property_value: @get('email')
      ]
    ).then (data)=>
      @set 'number_of_events', data
