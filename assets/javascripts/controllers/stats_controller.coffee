Postman.StatsController = Ember.ObjectController.extend
  categories: []
  selectedCategory: null
  stats: null

  processed: (->
    result = 0
    if @get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "processed"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  delivered: (->
    result = 0
    if @get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "delivered"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  delivered_percent: (->
    if @get('delivered') && @get('total')
      Math.floor @get('delivered') / @get('total') * 100
    else
      0
  ).property('delivered', 'total')

  opened: (->
    result = 0
    if @get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "open"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  opened_percent: (->
    if @get('opened') && @get('total')
      Math.floor @get('opened') / @get('total') * 100
    else
      0
  ).property('opened', 'total')

  bounced: (->
    result = 0
    if @get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "bounce"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  bounced_percent: (->
    if @get('bounced') && @get('total')
      Math.floor @get('bounced') / @get('total') * 100
    else
      0
  ).property('bounced', 'total')

  dropped: (->
    result = 0
    if @get('stats')?
      eventResult = @get('stats').filter((eventStats)->
        eventStats.event == "dropped"
      )[0]
      result = eventResult.result if eventResult?
    result
  ).property('stats')
  dropped_percent: (->
    if @get('dropped') && @get('total')
      Math.floor @get('dropped') / @get('total') * 100
    else
      0
  ).property('dropped', 'total')

  total: (->
    @get('processed') + @get('dropped')
  ).property('processed', 'dropped')

  actions:
    filter: ->
      if @get 'selectedCategory'
        @transitionToRoute 'stats.category', category: @get('selectedCategory')
      else
        @transitionToRoute 'stats'
