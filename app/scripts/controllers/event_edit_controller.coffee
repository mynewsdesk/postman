# EmberMail.EventEditController = Ember.ObjectController.extend(
#   needs: 'event'
#   actions:
#     save: ->
#       self = this
#       @get('buffer').forEach (attr)->
#         self.get('controllers.event.model').set(attr.key, attr.value)
#       @transitionToRoute 'event', @get('model')
# )
