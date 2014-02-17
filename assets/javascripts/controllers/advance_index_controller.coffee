Postman.AdvanceIndexController = Ember.ObjectController.extend
  selectedAttribute: null
  attributeValue: null
  actions:
    search: ->
      @transitionToRoute 'advance.search', attribute: @get('selectedAttribute'), value: @get('attributeValue')
