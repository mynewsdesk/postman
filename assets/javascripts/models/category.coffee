Postman.Category = Ember.Object.extend
  name: null
  url_param: (->
    @get('name').replace("#", "-") if @get 'name'
  ).property('name')

Postman.Category.reopenClass
  from_url: (url_param)->
    Postman.Category.create name: url_param.replace("-", "#")
