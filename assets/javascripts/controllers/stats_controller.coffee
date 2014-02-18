Postman.StatsController = Ember.ObjectController.extend
  categories: []
  selectedCategory: null
  stats: null

  processed: (->
    result = 0
    if @.get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "processed"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  delivered: (->
    result = 0
    if @.get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "delivered"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  delivered_percent: (->
    if @get('delivered') && @get('processed')
      Math.floor @get('delivered') / @get('processed') * 100
    else
      0
  ).property('delivered', 'processed')

  opened: (->
    result = 0
    if @.get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "open"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  opened_percent: (->
    if @get('opened') && @get('processed')
      Math.floor @get('opened') / @get('processed') * 100
    else
      0
  ).property('opened', 'processed')

  bounced: (->
    result = 0
    if @.get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "bounce"
      )[0]
      result = eventResult.result if eventResult?
    result
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
