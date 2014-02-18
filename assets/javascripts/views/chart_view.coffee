Postman.ChartView = Ember.View.extend
  width: 100
  height: (->
    (@get('width') / 1.618) / 1.618
  ).property('width')
  contentUpdated: (->
    if @get 'content'
      Keen.onChartsReady =>
        myLineChart = new Keen.MultiLineChart @get('content'),
          chartAreaLeft: 0
          chartAreaTop: 0
          width: @get 'width'
          height: @get 'height'
          lineWidth: 5
          color: "red"
          backgroundColor: "transparent"
          showLegend: true
        myLineChart.draw(@$()[0]);
  ).observes("content")

  didInsertElement: ->
    @set 'width', @$().width()
    @contentUpdated()
