Postman.ApplicationView = Ember.View.extend()


Postman.OdometerView = Ember.View.extend
  tagName: 'span'
  od: null
  contentUpdated: (->
    @get('od').update @get('content')
  ).observes("content")
  didInsertElement: ->
    @set 'od', new Odometer
      el: @$()[0]
      value: @get('content')
      format: ""
      theme: "minimal"
