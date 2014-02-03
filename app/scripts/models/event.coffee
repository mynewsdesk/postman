Postman.Event = Ember.Object.extend
  event: null
  category: null
  ip: null
  timestamp: null
  material_type: null
  material_id: null
  source_id: null

  source_url: (->
    "http://www.mynewsdesk.com/admin/source/edit/#{@get('source_id')}" if @get('source_id')
  ).property('source_id')

  material_url: (->
    "http://www.mynewsdesk.com/admin/source/edit_#{@get('material_type').toLowerCase()}/#{@get('material_id')}" if @get('material_id') && @get('material_type')
  ).property('material_id', 'material_type')
