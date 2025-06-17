
/*--let targuetNumber = Math.floor(Math.random()*100)+1;
console.log(targuetNumber);

let userNumber = prompt('Devinez un nombre entre 5 et 50 :');

while(userNumber != targuetNumber) {

    if(userNumber > targuetNumber){
        alert(`c'est trop grand!`);
    } else{
        alert(`C'est trop petit`);
    }
     
    userNumber = prompt('Devinez un nombre entre 5 et 50 :')

}
alert(`bravos, vous avez trouvez`);*/

let trigger = document.querySelector('#send-button')
//let exemple = document.queryselectorAll('div');
let numnerZone = document.querySelector('#user-number');
let displayZone = document.querySelector('#game-display');

let targuetNumber = Math.floor(Math.random()*100)+1;

console.log(trigger,numnerZone,displayZone,targuetNumber);

function compareNumber() {
    //console.log("ça marche")
    let userNumber = numnerZone.value;
    let result;
    //console.log(userNumber);
    if(userNumber==targuetNumber){
        result = 'gagné'
    }else if(userNumber > targuetNumber){
      result = `c'est trop grand!`;
    } else{
        result = `C'est trop petit`;
    }

    let resultZone = document.createElement('p');
    resultZone.innerHTML = result;
    resultZone.style.padding = "15px";
    resultZone.classList.add('result-line');


     //console.log(resultZone)
    displayZone.appendChild(resultZone);
}

    
    

   



trigger.addEventListener('click',compareNumber);






















/*
let firstname = prompt('quel est votre prénom ? ');

let lastname = prompt('quel est votre nom ?');

alert(`bonjours ${firstname} ${lastname}!`);*/