EmberMail.Router.map( ->

  @resource('events', ->
    @resource('event', path: '/:email/:category', ->
    )
  )
)