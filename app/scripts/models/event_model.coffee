EmberMail.Email = Ember.Object.extend
  email: null
  category: null
  number_of_events: null
  loading: true

  init: ->
    filters = [
        property_name: "email"
        operator: "eq",
        property_value: @get('email')
      ,
        property_name: 'timestamp'
        operator: 'gt'
        property_value: EmberMail.KeenFetcher.time.previous_minutes(30)
    ]
    filters.unshift(
      property_name: "category"
      operator: "eq",
      property_value: @get('category')
    ) unless @get('category') == 'all'

    EmberMail.KeenFetcher.metric(
      analysisType: "count",
      filters: filters
    ).then (data)=>
      @set 'number_of_events', data
      @set 'loading', false
