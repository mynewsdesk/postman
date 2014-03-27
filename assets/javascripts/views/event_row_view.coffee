Postman.EventRowView = Ember.View.extend
  templateName: 'email/event_row'
  tagName: 'tbody'
  showMore: false
  dataClass: (->
    "event-data #{if @get('showMore') then "active" else "nonactive"}"
  ).property('showMore')
  didInsertElement: ->
    @$().on "click", "tr.event-row", (evt)=>
      @toggleProperty('showMore')

