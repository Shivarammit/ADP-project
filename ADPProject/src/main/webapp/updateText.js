window.onload=function(){
    let textarea=document.getElementById("about");
    textarea.addEventListener("keypress",addUpdateButton);
    console.log(10)
    function addUpdateButton(){
    document.getElementById("update").style.display="block"
    }
}