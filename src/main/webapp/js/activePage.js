/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


//const activePage = window.location.pathname;
//const navlinks = document.querySelectorAll('ul a').
//        forEach(link => {
//            if(link.href.includes(`${activePage}`)){
//                link.classList.add('active');
//            }
//        })

function toto() {
    alert("toto");
}

var btnContainer = document.getElementById("side-menu");
var btns = document.getElementsByClassName("btn");

for(var i=0; i<btns.length; i++){
    btns[i].addEventListener('click', function(){
        var current = document.getElementsByClassName("active");
        console.log("This ddddd")
        current[0] = className = current[0].className.replace("active");
        this.className += "active";
    })
}