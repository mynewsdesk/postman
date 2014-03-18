Postman.FlashModel = Ember.Object.extend
  type: null
  message: null
  header: null
  isAlert: Ember.computed.equal("type", "alert")
  isSuccess: Ember.computed.equal("type", "success")
  clear: ->
    @update null, null
    return

  update: (type, message, header) ->
    @set "type", type
    @set "message", message
    @set "header", header
    return

  success: (message, header) ->
    @update "success", message, header
    return

  alert: (message, header) ->
    @update "alert", message, header
    return

Postman.set('flash', Postman.FlashModel.create());
