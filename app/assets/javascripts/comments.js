// var deleteIcon = "<% if comment.user == current_user %><%= link_to '', contest_comment_path(@contest, comment), :class => 'icon-remove', :remote => true, :method => 'delete' %><% end %>";

var Comment = {
  init: function() {
    $('form.new_comment').on('ajax:success', this.appendComment);
    $('form.new_comment').on('ajax:success', this.clearTextArea);
    $('form.new_comment').on('ajax:error', this.showErrors);
    $('.comments').on('click', 'a.icon-remove', this.confirmDelete);
    $('.comments').on('ajax:success', 'a.icon-remove', this.deleteComment);
  },
    
  appendComment: function(event, data) {
    $('li#comment_errors').hide();
    debugger
    $(this).siblings("ul").append('<li>' + data.comment.content + '</li>');
    $(this).siblings("ul").append('Posted by: ' + data.user.username); //Can add deleteIcon in the future
  },

  showErrors: function(xhr, data, status) {
    if (data.statusText == "Unauthorized") return window.location = data.responseText
      $('ul.comments').before("<li id='comment_errors'>" + data.responseText + "</li>");
  },

  confirmDelete: function() {
    if (!confirm("Are you sure you want to delete this comment?")) return false;
  },

  clearTextArea: function() {
    $('textarea#comment_content').val("");
  },

  deleteComment: function() {
    $(this).parent('li').hide('slow');
  }
}

$(document).ready(function() {
  Comment.init();
});
