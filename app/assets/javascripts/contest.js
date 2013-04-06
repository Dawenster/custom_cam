$(document).ready(function($) {
  $('.photo-and-button').hover(function() {
    $(this).children("button").toggle();
  });

  $('.winner-button').click(function(e) {
    e.preventDefault();

    alert("Are you sure you want to select this photo as the winner?  There's nothing you can do about it... you've already committed.")
    var photoID = $(this).attr("data-photo")
    var contestID = $(this).attr("data-contest")

    $.ajax({
      url: '/contests/' + contestID,
      method: 'put',
      data: { photo: photoID }
    })
    .done(function() {
      window.location = '/contests/' + contestID;
    })
  });
});
