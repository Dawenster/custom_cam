$(document).ready(function($) {
  $('.click-star').click(function() {
    var data = $(this).attr("id");
    $.ajax({
      url: '/ratings',
      method: 'post',
      data: { data: data }
    })
    .done(function(data) {
      var stars = starCount(data.avg);
      $('.photo_' + data.id + ' span').html(stars);
      $('li.photo_' + data.id + '-rate').html("Thank you for rating!");
      console.log(data.unround)
    })
    .fail(function(data) {
      alert(data);
    })
  })
});

var starCount = function(num) {
  switch(num) {
  case 1:
    return "<img src='/assets/gold_star.gif'>"
    break;
  case 2:
    return "<img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'>"
    break;
  case 3:
    return "<img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'>"
    break;
  case 4:
    return "<img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'>"
    break;
  case 5:
    return "<img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'><img src='/assets/gold_star.gif'>"
    break;
  }
}
