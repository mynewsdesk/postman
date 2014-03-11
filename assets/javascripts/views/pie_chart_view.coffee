Postman.PieChart = Ember.View.extend
  width: 100
  height: (->
    @get('width') / 2
  ).property('width')
  contentUpdated: (->
    if @get 'content'
      Keen.onChartsReady =>
        myLineChart = new Keen.PieChart @get('content'),
          chartAreaHeight: @get('height')
          chartAreaLeft: 10
          chartAreaTop: 10
          width: @get 'width'
          height: @get 'height'
          chartAreaWidth: @get('width') - 100
          lineWidth: 5
          color: "red"
          backgroundColor: "transparent"
          showLegend: true
        myLineChart.draw(@$()[0]);
  ).observes("content")

  didInsertElement: ->
    @set 'width', @$().width()
    @contentUpdated()
