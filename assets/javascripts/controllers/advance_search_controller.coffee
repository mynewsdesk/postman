Postman.AdvanceSearchController = Ember.ArrayController.extend
  queryParams: Postman.configs.customEventAttributes
  sortProperties: ['timestamp']
  sortAscending: false
  showEmail: true
  customAttributes: (->
    Postman.configs.customEventAttributes.filter (category) =>
      category if @get('content').filter((emailEvent) ->
        emailEvent.get(category)?
      ).length
  ).property('content')
