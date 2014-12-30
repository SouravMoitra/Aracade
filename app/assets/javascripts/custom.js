$(function(){
  $(".leftpanel").hide();
  hideLeftPanelElements();
  $(".search-btn").on("click", function(e){
    e.preventDefault();
    hideLeftPanelElements();
    toggleLeftPanel("toggle");
  });
  $(document).on('click', function(e) {
    var container = $(".leftpanel");
    if (!container.is(e.target) && container.has(e.target).length === 0 && e.target.id != "search-btn" && !$(".navbar-toggle").is(e.target)) {
      toggleLeftPanel("hide");
    }
  })
  $(".search-form-btn").on("click", function(){
    alert("hello");
  });
});

function hideLeftPanelElements() {
  $(".search-area").hide();
  $(".search-form-btn").hide();
  $(".search-form-checkboxes").hide();
}

function toggleLeftPanel(todo) {
  $(".leftpanel").animate({width: todo}, 900, function() {
    $(".search-area").animate({width: todo}, 400, function() {
      $(".search-form-btn").animate({width: todo}, 400, function() {
        $(".search-form-checkboxes").animate({width: todo, height: todo}, 700)
      });
    });
  });
}
