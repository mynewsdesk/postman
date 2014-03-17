Postman.DaterangepickerView = Ember.View.extend
  tagName: 'a'
  classNames: ['a-daterangepicker']
  attributeBindings: ["start", "end"]
  templateName: 'daterangepicker'
  start: null
  end: null
  format: 'YYYY-MM-DD'
  description: (->
    "#{@get('start')} - #{@get('end')}"
  ).property('start', 'end')
  didInsertElement: ->
    @$().daterangepicker
      opens: 'left'
      format: @get('format')
      startDate: @get('start')
      endDate: @get('end')
    ,
    (start, end)=>
      @set('start', start.format(@get 'format'))
      @set('end', end.format(@get 'format'))
