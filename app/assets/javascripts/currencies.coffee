$ ->
  $('.visit-country').click (e) ->
    e.preventDefault
    element = $(this)
    unless element.data('visited')
      $.ajax
        url: '/countries/' + element.data('country-id') + '/visit'
        type: 'PUT'
        dataType: 'json'
        data: ''
        success: (response) ->
          element.append(response.html)
          element.data('visited', true)
        error: (response) ->
          alert 'Error' + response.status + '.'
          console.log response
