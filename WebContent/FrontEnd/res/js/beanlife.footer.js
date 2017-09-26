//func bar toogle
//0926失效
var scrollPos = 0;
window.onscroll = function() {myFunction()};

function myFunction() {
  if (document.body.scrollTop < 1) {
    $("#funcbar").stop(true);
        $("#funcbar").slideDown("300");
        scrollPos = document.body.scrollTop;
        return;
  }
    if ((document.body.scrollTop-scrollPos) >= 0) {
      $("#funcbar").stop(true);
        $("#funcbar").slideUp("300");
        scrollPos = document.body.scrollTop;
    } else {
      $("#funcbar").stop(true);
        $("#funcbar").slideDown("300");
        scrollPos = document.body.scrollTop;
    }
}
//modal closed toTop
$('#modal-id').on('hide.bs.modal', function (e) {
	$modalX.scrollTop(0);
	return;
});

