Postman.Router.reopen
  location: 'history'

Postman.Router.map( ->
  @resource('stats', path: '/stats', ->
    @route('category', path: '/:category', ->)
  )
  @resource('advance', path: '/advance', ->
    @route('search', path: '/search', ->)
  )

  @resource('emails', ->
    @resource('email', path: ':email', ->
      @route('events', path:'events/:category')
    )
  )
)
