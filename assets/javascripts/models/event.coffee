Postman.Event = Ember.Object.extend
  event: null
  category: null
  ip: null
  timestamp: null
  material_type: null
  material_id: null
  source_id: null
  reason: null

  allData: (->
    JSON.stringify(@, null, " ")
  ).property()

  customAttributes: (->
    Postman.configs.customEventAttributes.map (attribute)=>
      @get attribute
  ).property(Postman.configs.customEventAttributes, 'Postman.configs')

  filteredCustomAttributes: (->
    @get('customAttributes').filter (attribute) =>
      attribute?
  ).property('customAttributes')

  tooltip: (->
    if @get('event') == 'bounce'
      "Bounce: #{@get 'reason'}"
    else
      @get 'event'
  ).property('reason')

  fontAwesome: (->
    icons =
      bounce: 'times-circle-o'
      click: 'hand-o-up'
      deferred: 'refresh'
      delivered: 'inbox'
      dropped: 'arrow-circle-o-down'
      open: 'envelope-o'
      processed: 'cog'
      spamreport: 'bolt'

    "fa fa-#{icons[@.get('event')]}"
  ).property('event')
