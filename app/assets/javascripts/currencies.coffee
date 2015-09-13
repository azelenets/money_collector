$ ->
  $('.visit-country').on 'click', (event) ->
    event.preventDefault()
    element = $(this)
    unless element.data('visited')
      $.ajax
        url: '/countries/' + element.data('country-id') + '/visit'
        type: 'PUT'
        dataType: 'json'
        data: ''
        success: (response) ->
          element.find('.list-group-item-heading').prepend(response.html)
          element.data('visited', true)
        error: (response) ->
          alert 'Error' + response.status + '.'
          console.log response
