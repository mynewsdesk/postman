Postman.ApplicationController = Ember.ObjectController.extend
  email: null
  category: null

  start: null
  startTime: (->
    "#{@get 'start'}T00:00Z" if @get 'start'
  ).property('start')

  end: null
  endTime: (->
    "#{@get 'end'}T23:59Z" if @get 'end'
  ).property('end')

  timeframe: (->
    if @get('startTime') and @get('endTime')
      start: @get('startTime')
      end: @get('endTime')
    else
      'this_30_days'
  ).property('startTime', 'endTime')

  queryParams: ['start', 'end']
