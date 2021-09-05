var btn_menu=document.getElementById("btn_menu");
var menu=document.getElementById("menu");
var header=document.getElementById("header");
var cardList=document.getElementById("cardList");


btn_menu.addEventListener("click",function(){
    btn_menu.classList.toggle('activateBtn');
    menu.classList.toggle("activate");
    header.classList.toggle("activateHeader");
    cardList.classList.toggle("activateCard");
});