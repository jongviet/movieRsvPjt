$(document).ready(function() {
   document.getElementById('delBtnMemberListPage').addEventListener('click', function() {
     if (confirm("선택된 회원(들)을 정말 삭제하시겠습니까?")) {
         var checkboxList = document.getElementsByName("delChecked");
         var checkedList = [];
         
         for (var i = 0; i < checkboxList.length; i++) {
            if (checkboxList[i].checked)
               checkedList.push(Number(checkboxList[i].nextSibling.value))
         }
         
         if (checkedList == null || checkedList.length < 1)
            return;
         
         //체크된 목록 있을 때
         $.ajax({
            url : './mc',
            type : 'post',
            data : {
               nextSt : "delete",
               checkedList : JSON.stringify(checkedList)
            },
            success : function() {
              alert("선택된 회원 삭제 완료");
              window.location.reload();
            },
            error : function(err) {
               alert(err);
            }
         })  
     }
   });
});