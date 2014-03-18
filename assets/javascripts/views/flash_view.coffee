Postman.FlashView = Ember.View.extend
  templateName: "flash"
  classNames: ["alert alert-dismissable"]
  classNameBindings: [
    "success:alert-success"
    "alert:alert-warning"
  ]
  messageBinding: "model.message"
  headerBinding: "model.header"
  alertBinding: "model.isAlert"
  successBinding: "model.isSuccess"
  isEmpty: (->
    !@get('message') and !@get('header')
  ).property('message', 'header')
  didInsertElement: ->
    @hide()  if @get("isEmpty")
  onMessageChange: (->
    (if @get("isEmpty") then @hide() else @show())
  ).observes("message", "header")
  hide: ->
    @$().hide()

  show: ->
    @$().show()

  click: (e) ->
    e.preventDefault()
    @get("model").clear()
