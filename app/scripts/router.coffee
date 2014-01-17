EmberMail.Router.map( ->

  @resource('events', ->
    @resource('event', path: '/:category/:email', ->
    )
  )
)
