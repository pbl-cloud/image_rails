var inputImg;
var selectedImg;

$(function(){
	$("#bxslider").bxSlider({
		minSlides: 6,
		maxSlides: 6,
		slideWidth: 200,
		slideMargin: 10,
		speed: 1000,
		infiniteLoop: false,
		hideControlOnEnd: true
	})
})

$(".hoveringimages").bxSlider({
	pagerCustom: "#bxslider"
});

$(function() {
  $('input[type=file]').change(function() {
    inputImg = $(this).prop('files')[0];
  });
});

$(function() {
	$("*[name=img1]").css("border", "2px solid #ff0000");
	$("#selected").css("border", "2px solid #ff0000");
})

$(function() {
	$(".select").click(function (){
		$('#created_picture_base_picture_id').val($(this).data('id'));
		selectedImg = this;
		$(".select").css("border", "0px");
		$("*[name="+this.name+"]").css("border", "2px solid #ff0000");
		$("#selected").attr({src: selectedImg.src});
		$(':hidden[name="selectedImg"]').val(selectedImg.name);
	});
});

$(function() {
	$(".select").hover(
		function (){
			$("*[name="+this.name+"]").css("border", "2px solid #00ff00");
			$("#hovering").attr({src: this.src});
		},function (){
			if(this==selectedImg){
				$("*[name="+this.name+"]").css("border", "2px solid #ff0000");
			}else{
				$("*[name="+this.name+"]").css("border", "0px");
			}
		}
	);
});

function check(){
	if(inputImg==undefined){
		window.alert("アップロードする画像を選択してください");
		return false;
	}else{
		if(window.confirm(inputImg.name+","+selectedImg.name+"を送信しますか？")){
			return true;
		}else{
			window.alert("キャンセルされました");
			return false;
		}
	}
}
