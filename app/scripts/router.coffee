Postman.Router.map( ->
  @resource('email', path: '/email/:email', ->
    @resource('email.events', path: 'events/:category', ->
    )
  )
)
