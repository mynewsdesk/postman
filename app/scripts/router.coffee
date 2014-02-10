Postman.Router.reopen
  location: 'history'

Postman.Router.map( ->
  @resource('advance', path: '/advance', ->

  )
  @resource('email', path: '/email/:email', ->
    @resource('email.events', path: 'events/:category', ->
    )
  )
)
