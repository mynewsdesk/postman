Postman.StatsController = Ember.ObjectController.extend
  categories: []
  selectedCategory: null

  actions:
    filter: ->
      if @get 'selectedCategory'
        @transitionToRoute 'stats.category', category: @get('selectedCategory')
      else
        @transitionToRoute 'stats'
