Postman.Router.reopen
  location: 'history'

Postman.Router.map( ->
  @resource('advance', path: '/advance', ->
    @route('search', path: '/:attribute/:value', ->)
  )

  @resource('emails', ->
    @resource('email', path: ':email', ->
      @route('events', path:'events/:category')
    )
  )
)
