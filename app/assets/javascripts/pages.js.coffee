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
    
  $("#payment-form").submit (event) ->

    $(".submit-button").attr "disabled", "disabled"
    Stripe.createToken
      number: $(".card-number").val()
      cvc: $(".card-cvc").val()
      exp_month: $(".card-expiry-month").val()
      exp_year: $(".card-expiry-year").val()
    , stripeResponseHandler
    # prevent the form from submitting with the default action
    return false
    
  stripeResponseHandler = (status, response) ->
    console.log response
    if response.error
      $(".payment-errors").text response.error.message
      $(".submit-button").removeAttr "disabled"
    else
      form$ = $("#payment-form") 
      # token contains id, last4, and card type
      token = response["id"]
      # insert the token into the form so it gets submitted to the server
      form$.append "<input type='hidden' name='stripeToken' value='" + token + "'/>"
      # and submit
      form$.get(0).submit()