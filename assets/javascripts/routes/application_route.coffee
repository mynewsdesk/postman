Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', Postman.configs.startNumber

    if not controller.get('start') and not model.start
      controller.set 'start', moment().subtract('days', 30).format('YYYY-MM-DD')

    if not controller.get('end') and not model.end
      controller.set 'end', moment().format('YYYY-MM-DD')


    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data
