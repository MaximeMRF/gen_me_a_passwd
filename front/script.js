console.log("Script start");

document.getElementById('gen').addEventListener('click', ()=> {

    let len = document.getElementById('passLen').value;
    len = Number(len);
    let url = `http://localhost:8080/password`;

    if (len > 12 && len <= 50)
        url = `http://localhost:8080/password?len=${len}`;

    fetch(url)
        .then(response => response.json())
        .then(data => document.getElementById('output').innerHTML = data.password);
});