Postman.ChartView = Ember.View.extend
  width: 100
  height: (->
    (@get('width') / 1.618) / 1.618
  ).property('width')
  contentUpdated: (->
    if @get 'content'
      Keen.onChartsReady =>
        myLineChart = new Keen.MultiLineChart @get('content'),
          chartAreaLeft: 80
          chartAreaTop: 10
          width: @get 'width'
          height: @get 'height'
          chartAreaWidth: @get('width') - 100
          lineWidth: 5
          color: "red"
          backgroundColor: "transparent"
          showLegend: false
        myLineChart.draw(@$()[0]);
  ).observes("content")

  didInsertElement: ->
    @set 'width', @$().width()
    @contentUpdated()
