$(function(){
   $('#submit1').click(function(){
    if(valichk()){
	   return false;
      }
     $('form').submit();
   });

   $('#idchck').on("propertychange change input past", function(){ //id가 idchck라른 곳에 무엇인가 값이 변해
		$.ajax({ //ajax 는 서버를 갔다와라..
			asynk:true, //비동기 방식으로 처리 
			type:'post', 
			url:"idCheck", //url주소는 idCheck로 갔다와라
			dataType:"json", //data의 타입은 json은 "키":"값" 형태
			data:{"id":$("#idchck").val()},  //키가 id이고, 값은 "아이디가 idchck인 곳의 value(val())를 갖고와"
			success : function(data){
				if(data>0){
				  $('font[id=warning]').text('');
				  $('font[id=warning]').attr('color','red');
				  $('font[id=warning]').text('이미 존재하는 아이디');
		          $('#idchck').focus();
				}else{
				  $('font[id=warning]').text('');
				  $('font[id=warning]').attr('color','blue');
				  $('font[id=warning]').text('사용가능한 아이디');
		          $('#idchck').focus();	
				}
			},
			error : function(e){
				alert("error: "+"에러났어요");
			}
		});
  });
//update용
  $('#update1').click(function(){
    $('form').attr('action', "updateForm");
     //비밀번호 확인
     var spass= $("input[name='passwd']").val();//$("#pass").val()
     var gpass = prompt('비밀번호 입력하시오.')
     if(spass==gpass){
      $('form').submit();
     }else{
	   alert("비밀번호 오류")
       return false;
      }
   });
//delate용
  $('#delete1').click(function(){
     $('form').attr('action', "deleteProc");
     //비밀번호 확인
     var spass= $("input[name='passwd']").val();//$("#pass").val()
     var gpass = prompt('비밀번호 입력하시오.')
     if(spass==gpass){
	   var cm = confirm("정말삭제할까요?")
       if(cm) $('form').submit();
       else return false;
     }else{
	   alert("비밀번호 오류")
       return false;
      }
   });
  //reply용
 $('#reply').click(function(){
  $('form').attr('action', "writeForm");
  $('form').submit();
	 });
})//document의 끝
	 
 function valichk(){
	var flen = $("form[name='boardForm'] .chk").length;
	for(var i=0; i<flen; i++){
	   if($('.chk').eq(i).val()=="" || $('.chk').eq(i).val()==null || $('.chk').eq(i).val().trim()==""){
		   alert($('.chk').eq(i).attr("title")+"은/는 필수 입력 항목 입니다." );
          $('.chk').eq(i).focus();
          return true;
	   }	
	}
   };