
let targuetNumber = Math.floor(Math.random()*100)+1;
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
alert(`bravos, vous avez trouvez`);
























/*
let firstname = prompt('quel est votre prénom ? ');

let lastname = prompt('quel est votre nom ?');

alert(`bonjours ${firstname} ${lastname}!`);*/