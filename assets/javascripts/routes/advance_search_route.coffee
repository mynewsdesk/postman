Postman.AdvanceSearchRoute = Ember.Route.extend
  model: (params)->
    params

  setupController: (controller, model) ->
    controller.set 'model', []
    controller.set 'loading', true
    filters = Postman.configs.customEventAttributes.map((attribute)->
      if model[attribute]
        property_name: attribute
        operator: "eq"
        property_value: model[attribute]
    ).filter (filter)->
      filter?

    Postman.KeenFetcher.data(
      timeframe: @controllerFor('application').get('timeframe')
      filters: filters

    ).then ((data) ->
      controller.set 'model', data.result.map (item)->
        Postman.Event.create(item)
      controller.set 'loading', false
    ), (reason) ->
      Postman.get('flash').alert(reason,"Keen Error");
      controller.set 'loading', false

    Postman.KeenFetcher.metric(
      analysisType: "count_unique"
      targetProperty: "email"
      groupBy: 'event'
      filters: filters
      timeframe: @controllerFor('application').get('timeframe')
    , true
    ).then (data)=>
      data_reduced = data.reduce(((total, current) ->
        total[current.event] = current.result
        total
      ), {
        processed: 0,
        dropped: 0,
        delivered: 0,
        bounce: 0,
        deferred: 0,
        open: 0,
        click: 0,
      })

      stage1_total = data_reduced.processed + data_reduced.dropped;
      stage2_total = data_reduced.delivered + data_reduced.bounce + data_reduced.deferred;
      stage3_total = data_reduced.open + data_reduced.click;

      data_reduced = {
        stage1: {
          processed: data_reduced.processed,
          processedPercentage: parseFloat(data_reduced.processed / stage1_total * 100).toFixed(2),
          dropped: data_reduced.dropped,
          droppedPercentage: parseFloat(data_reduced.dropped / stage1_total * 100).toFixed(2),
          total: stage1_total,
        },
        stage2: {
          delivered: data_reduced.delivered,
          deliveredPercentage: parseFloat(data_reduced.delivered / stage2_total * 100).toFixed(2),
          bounce: data_reduced.bounce,
          bouncePercentage: parseFloat(data_reduced.bounce / stage2_total * 100).toFixed(2),
          deferred: data_reduced.deferred,
          deferredPercentage: parseFloat(data_reduced.deferred / stage2_total * 100).toFixed(2),
          total: stage2_total,
        },
        stage3: {
          open: data_reduced.open,
          openPercentage: parseFloat(data_reduced.open / stage3_total * 100).toFixed(2),
          click: data_reduced.click,
          clickPercentage: parseFloat(data_reduced.click / stage3_total * 100).toFixed(2),
          total: stage3_total,
        },
      }

      @controllerFor('advance').set 'advanceStats', data_reduced
