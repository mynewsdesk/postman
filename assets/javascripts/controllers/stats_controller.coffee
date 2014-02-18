Postman.StatsController = Ember.ObjectController.extend
  categories: []
  selectedCategory: null
  stats: null

  processed: (->
    return 0 unless @.get('stats')?
    @get('stats').filter((eventStats)->
      eventStats.event == "processed"
    )[0].result
  ).property('stats')
  delivered: (->
    return 0 unless @.get('stats')?
    @get('stats').filter((eventStats)->
      eventStats.event == "delivered"
    )[0].result
  ).property('stats')
  delivered_percent: (->
    if @get('delivered') && @get('processed')
      Math.floor @get('delivered') / @get('processed') * 100
    else
      0
  ).property('delivered', 'processed')

  opened: (->
    return 0 unless @.get('stats')?
    @get('stats').filter((eventStats)->
      eventStats.event == "open"
    )[0].result
  ).property('stats')
  opened_percent: (->
    if @get('opened') && @get('processed')
      Math.floor @get('opened') / @get('processed') * 100
    else
      0
  ).property('opened', 'processed')

  bounced: (->
    return 0 unless @.get('stats')?
    @get('stats').filter((eventStats)->
      eventStats.event == "bounce"
    )[0].result
  ).property('stats')
  bounced_percent: (->
    if @get('bounced') && @get('processed')
      Math.floor @get('bounced') / @get('processed') * 100
    else
      0
  ).property('bounced', 'processed')

  actions:
    filter: ->
      if @get 'selectedCategory'
        @transitionToRoute 'stats.category', category: @get('selectedCategory')
      else
        @transitionToRoute 'stats'
