$( document ).ready(function() {

	  $(document).on("click","#site-settings",function(){
        $("#settings-panel").toggleClass("on-screen");
				$("#page-content").toggleClass("settings-panel-on");
    });
    $(document).on("click","#settings-panel .close-panel",function(){
        $("#settings-panel").removeClass("on-screen");
				$("#page-content").removeClass("settings-panel-on");
    });

		$('#surah-info-check').change(function(){
        if ($(this).is(':checked')) {
            sessionStorage.setItem("surah_info_checked",true);
        }else{
						sessionStorage.setItem("surah_info_checked",false);
				}
    });

		$('#notes-check').change(function(){
        if ($(this).is(':checked')) {
            sessionStorage.setItem("notes_checked",true);
        }else{
						sessionStorage.setItem("notes_checked",false);
				}
    });


		$('#translation-check').change(function(){
        if ($(this).is(':checked')) {
            $(".verse-content").toggleClass("hidden")
						sessionStorage.setItem("translation_checked",true);
        }else{
						$(".verse-content").removeClass("hidden")
						sessionStorage.setItem("translation_checked",false);
				}
    });

		$('#night-mode-check').change(function(){
        if ($(this).is(':checked')) {
            $("body").toggleClass("night-mode")
						sessionStorage.setItem("night_mode_checked",true);
        }else{
						$("body").removeClass("night-mode")
						sessionStorage.setItem("night_mode_checked",false);
				}
    });

});


$( document ).ready(function() {

		var arabic_objs = $(".verse-content")
		var kan_objs = $(".verse-translation")

		var arabic_font_size = sessionStorage.getItem("arabic_font_size");
		var kan_font_size = sessionStorage.getItem("kan_font_size");
		if(isNaN(parseInt(arabic_font_size))){
			arabic_font_size = parseInt(arabic_objs.css("font-size"))
			sessionStorage.setItem("arabic_font_size",arabic_font_size);
		}else {
			arabic_objs.css("font-size",arabic_font_size+"px");
		}
		if(isNaN(parseInt(kan_font_size))){
			kan_font_size = parseInt(kan_objs.css("font-size"))
			sessionStorage.setItem("kan_font_size",kan_font_size);
		}else{
			kan_objs.css("font-size",kan_font_size+"px");
			}

		$("#arabic-font-calib .font-minus").on("click",function(){
			arabic_font_size = parseInt(arabic_font_size) - 2;
			arabic_font_size = (arabic_font_size<12)? 12 : arabic_font_size;
			arabic_objs.css("font-size",arabic_font_size+"px");
			sessionStorage.setItem("arabic_font_size",arabic_font_size);
		})
		$("#arabic-font-calib .font-plus").on("click",function(){
			arabic_font_size = parseInt(arabic_font_size) + 2;
			arabic_font_size = (arabic_font_size>80)? 80 : arabic_font_size;
			arabic_objs.css("font-size",arabic_font_size+"px");
			sessionStorage.setItem("arabic_font_size",arabic_font_size);
		})

		$("#kan-font-calib .font-minus").on("click",function(){
			kan_font_size = parseInt(kan_font_size) - 2;
			kan_font_size = (kan_font_size<8)? 8 : kan_font_size;
			kan_objs.css("font-size",kan_font_size+"px");
			sessionStorage.setItem("kan_font_size",kan_font_size);
		})
		$("#kan-font-calib .font-plus").on("click",function(){
			kan_font_size = parseInt(kan_font_size) + 2;
			kan_font_size = (kan_font_size>50)? 50 : kan_font_size;
			kan_objs.css("font-size",kan_font_size+"px");
			sessionStorage.setItem("kan_font_size",kan_font_size);
		})

		var surah_info_checked = sessionStorage.getItem("surah_info_checked");
		if(surah_info_checked == null){
			surah_info_checked = $("#surah-info-check").is(':checked')
			sessionStorage.setItem("surah_info_checked",surah_info_checked);
		}else {
			$("#surah-info-check").prop("checked",surah_info_checked == "true").trigger( "change" )
		}
		var notes_checked = sessionStorage.getItem("notes_checked");
		if(notes_checked == null){
			notes_checked = $("#notes-check").is(':checked')
			sessionStorage.setItem("notes_checked",notes_checked);
		}else {
			$("#notes-check").prop("checked",notes_checked == "true").trigger( "change" )
		}
		var translation_checked = sessionStorage.getItem("translation_checked");
		if(translation_checked == null){
			translation_checked = $("#translation-check").is(':checked')
			sessionStorage.setItem("translation_checked",translation_checked);
		}else {
			$("#translation-check").prop("checked",translation_checked == "true").trigger( "change" )
		}
		var night_mode_checked = sessionStorage.getItem("night_mode_checked");
		if(night_mode_checked == null){
			night_mode_checked = $("#night-mode-check").is(':checked')
			sessionStorage.setItem("night_mode_checked",night_mode_checked);
		}else {
			$("#night-mode-check").prop("checked",night_mode_checked == "true").trigger( "change" )
		}


    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
        if($(this).scrollTop()+ $(this).innerHeight() >= $("#footer").offset().top) {
            $('#back-to-top').addClass("stay");
        }else{
            $('#back-to-top').removeClass("stay");
        }
    });
    $('#back-to-top').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});
