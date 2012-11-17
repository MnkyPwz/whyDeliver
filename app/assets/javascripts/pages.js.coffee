$ ->
  $("#clock-in").on "click", (e) ->
    transporter_id = $(e.target).attr("data-id")
    $.ajax
      url: "/transporters/#{transporter_id}"
      type: "PUT"
      data: { transporter: { available: true } }
      
  $("#clock-out").on "click", (e) ->
    transporter_id = $(e.target).attr("data-id")
    $.ajax
      url: "/transporters/#{transporter_id}"
      type: "PUT"
      data: { transporter: { available: false } }
    
  $("#accept-order").on "click", ->
    alert "not ready yet"