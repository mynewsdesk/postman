Postman.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model)->
    controller.set 'model', Postman.configs.startNumber

    if not controller.get('start')
      controller.set 'start', model.start or moment().subtract('days', 30).format('YYYY-MM-DD')

    if not controller.get('end')
      controller.set 'end', model.end or moment().format('YYYY-MM-DD')


    Postman.KeenFetcher.metric(analysisType: "count").then (data)->
      controller.set 'model', data

  actions:
    queryParamsDidChange: ->
      @refresh()

