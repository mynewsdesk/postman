Postman.Router.map( ->
  @resource('email', path: '/:email/:category', ->
    @resource('email.events', path: '/events', ->
    )
  )
)
