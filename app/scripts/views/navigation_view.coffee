Postman.NavView = Ember.View.extend
  tagName: 'li'
  classNameBindings: ['active']
  category: null
  templateName: 'navigation'

  active: (->
    @get('category').name == @get('parentView.controller.category.name')
  ).property('parentView.controller.category.name', 'category')

