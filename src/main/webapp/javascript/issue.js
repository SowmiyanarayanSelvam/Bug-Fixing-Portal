function makeit () {
 
 var comment = document.getElementById("addcomment").value;
 console.log(comment)
 console.log(comment.length)
 if(comment.length>0){
 	document.getElementById("sub").style.background="blue";
 	document.getElementById("sub").disabled=false;
 }
 if(comment.length==0){
 	document.getElementById("sub").style.background="gray";
 	document.getElementById("sub").disabled=true;
 }
 }
 
 