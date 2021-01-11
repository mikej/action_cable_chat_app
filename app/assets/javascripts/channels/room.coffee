App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert("You have a new mention from #{data.sender}") if data.mention
    unless !data.message?
      $('#messages-table').append data.message
      scroll_bottom()


submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click() # submit the form
      event.target.value = "" # clear the message box after submitting
      event.preventDefault # prevent default behaviour of adding new line to text area

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)

$(document).on 'turbolinks:load', () ->
  submit_message()
  scroll_bottom()