Postman.AdvanceIndexController = Ember.ObjectController.extend
  selectedAttribute: null
  attributeValue: null
  fields: [
    attributeValue: null
    selectedAttribute: null
  ]

  searchQuery: (->
    query = {}
    @get('fields').forEach (field)->
      query[field.selectedAttribute] = field.attributeValue
    query
  ).property('fields.@each.attributeValue')

  actions:
    addField: ->
      @get('fields').pushObject
        attributeValue: null
        selectedAttribute: null
    search: ->
      @transitionToRoute 'advance.search', queryParams: @get('searchQuery')

