updatePrice = () ->
  baseRate = parseInt($("#base-rate").html(),10)
  price = baseRate

  $("#discounts").empty()
  for item in $('.choice.selected')
    $item = $(item)
    additional = parseInt($item.find('.value').html(),10)
    price -= additional
    $discount = $item.find(".discount").clone()
    $("#discounts").append $discount
    $discount.show()

  $('.total .cost').html("$#{price}")
  $(".total")[0].scrollTop = $(".total")[0].scrollHeight

updateCalculations = () ->
  $(".choice").click () ->
    $(this).parent().find(".choice").removeClass('selected')
    $(this).addClass('selected')
    $discounts = $(this).find('.discount')
    if $discounts.length == 1
      name = $discounts.attr('name')
      achievements.flag name

    updatePrice()

  updatePrice()

achievements.define ['no_codebase', 'no_developers'], 
  title : '255 BITS Product',
  message : 'Let us work with you to define a product',
  discount : 0.25

###
achievements.define ['travel_infrequent', 'outside_denver'],
  title : 'Eco Friendly',
  message : 'No travel means more time to devote to the project, and less impact on the world.',
  discount : 0.075

achievements.define ['travel_bimonthly', 'outside_denver'],
  title : 'Familiar Faces',
  message : 'Meeting up a few times can help solidify visions.',
  discount : 0.05

achievements.define ['no_codebase', 'startup'], 
  title : 'Startup Clean Slate',
  message : 'Let us help you from the ground floor.  We can help make choices now that will help define your success.',
  discount : 0.25

achievements.received (achievement) ->
  console.log "User got"
  console.log achievement
###
$(document).ready updateCalculations
