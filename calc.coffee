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
    updatePrice()

  updatePrice()

$(document).ready updateCalculations
