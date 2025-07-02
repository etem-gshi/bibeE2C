let trigger = document.querySelector("#news-trigger");
let aside  = document.querySelector("aside");
/* reuperer la croix dans une variable */
let close = document.querySelector("#close");

            function showNews(){
             aside.style.right = "20px";
            trigger.style.opacity = "0";
}

        function closeNews() {
        /* remettre les éléments de style aux valeurs de départ*/ 
        aside.style.right = "-21%";
        trigger.style.opacity = "1";
}
    trigger.addEventListener("click", showNews);
    /* la croix détecte un click et declanche la fonction closNews*/ 
    close.addEventListener("click", closeNews);