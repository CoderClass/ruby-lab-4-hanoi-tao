// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
  $.getJSON(window.location.pathname + ".json", function(messages) {
    console.log(messages);
    e = $('.messages');
      e.html(''); // let's reset and insert all messages manually
      for (i in messages) {
        message = messages[i]
        e.append("<div class='message'><strong>" + message.username + "</strong> " + message.content + "</div>")
      }
  })
}