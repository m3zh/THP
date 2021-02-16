/* --------- 1 --------- */

let myfooter = document.querySelector('footer');
var count = 0;

myfooter.addEventListener("click", function (e) {
    e.preventDefault();
    if (count > 0) {
        console.log(`Clicked successfully! Click number ${count}`);
    } else {
        console.log("Clicked successfully! Keep clicking");
    };
    count += 1;
}
);

/* --------- 2 --------- */

var header = document.getElementsByTagName("header")[0];
// document.getElementsByTagName("header")[0].firstElementChild ==> return the right element
var menu = document.getElementById("navbarHeader");

header.addEventListener("click", function(e) {
    e.preventDefault();
    menu.classList.toggle("collapse");
}
);

/* --------- 3 and 4 --------- */

var editBtn = Array.from(document.querySelectorAll("div.btn-group > button.btn-outline-secondary"));
var cardText = document.querySelectorAll("p.card-text");
var greenText = false;

editBtn.map(function (btn, i) {
    btn.addEventListener("click", function (e) {
        if (i == 1) {
            if (greenText == false) {
                cardText[i].style.color = "green";
                greenText = true;
            } else {
                cardText[i].style.color = "black";
                greenText = false;
            }
        } else {
            cardText[i].style.color = "red";
        }
    });
});

/* --------- 5 --------- */

var linkTag = document.getElementsByTagName("link")[0];
var bootstrap = linkTag.href;
var styled = false;

window.addEventListener('click', function (e) {
    menu.addEventListener('click', function(){
    if (styled == false) {
        linkTag.href = bootstrap;
        document.head.appendChild(linkTag);
        styled = true;
    } else {
        e.preventDefault();
        linkTag.href = "";
        styled = false;
    }
})
});

// can be improved

/* --------- 6 --------- */
var viewBtn = Array.from(document.querySelectorAll("div.btn-group > button.btn-success"));
var cardImg = document.getElementsByClassName("card-img-top");

var reduced = false;

viewBtn.map(function(btn, i) {
    btn.addEventListener("mouseover", function (e) {
        if (reduced == false){
            cardText[i].style.visibility = "hidden";
            cardImg[i].style.width = "40%";
            cardImg[i].style.margin = "auto";
            reduced = true;
        } else {
            cardText[i].style.visibility = "visible";
            cardImg[i].style.width = "100%";
            reduced = false;
        }

    }
);
});

/* --------- 7 --------- */

var shuffleBtn = document.querySelector("section.jumbotron > div > p").lastElementChild;
var container = document.querySelector("div.album > div.container > div.row");
var card = document.querySelectorAll("div.col-md-4")


shuffleBtn.addEventListener("click", function(e, index){
    container.classList.add("flex");
    card[5].style.order = "-1";
});

/* --------- 8 --------- */

var unshuffleBtn = document.querySelector("section.jumbotron > div > p").firstElementChild;
console.log(unshuffleBtn.innerHTML)

unshuffleBtn.addEventListener("click", function(e){
    unshuffleBtn.href = "";
    container.classList.add("flex");
    card[0].style.order = "5";
});