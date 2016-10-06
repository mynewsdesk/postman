Postman.PieChart = Ember.View.extend
  width: 100
  height: (->
    @get('width') / 2
  ).property('width')
