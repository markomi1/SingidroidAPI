function rippleEffect() {
  const letters = Array.from(document.querySelectorAll('.card'))

  letters.forEach((letter) => {
    let timerId;
    //Yes, that's a lot of try catches with 0 error handling, i know
    letter.addEventListener('mousedown', (e) => {
      clearTimeout(timerId);
      const ripple = e.target.querySelector('.ripple')
      const size = letter.offsetWidth;
      const pos = letter.getBoundingClientRect();
      const x = e.pageX - pos.left - size;
      const y = e.pageY - pos.top - size;
      try {
        ripple.style = 'top:' + y + 'px; left:' + x + 'px; width: ' + size * 2 + 'px; height: ' + size * 2 + 'px;';
        ripple.classList.remove('active');
        ripple.classList.remove('start');

      } catch (e) {
 //No error catching
      }
      setTimeout(() => {
        try {
          ripple.classList.add('start')
        } catch (e) {
 //No error catching
        }
        setTimeout(() => {
          try {
            ripple.classList.add('active')
          } catch (e) {
            //No error catching
          }
        });
      });
    })
    letter.addEventListener('mouseup', (e) => {
      const ripple = e.target.querySelector('.ripple')
      clearTimeout(timerId);
      timerId = setTimeout(() => {
        try {
          ripple.classList.remove('active');
          ripple.classList.remove('start');
        } catch (e) {
           //No error catching
        }
      }, 500);
    })
  })
}

function toOpen(id,option,titleAdd) {
  var options = {
    content: "Ucitavanje...  <img src='/images/oval.svg' id='loader-icon' />  ",
    timeout: 0,
    htmlAllowed: true,
  }
  var t = $.snackbar(options);

  switch(option){
    case 1:
      loadPosts(id,t,titleAdd)
      break;
    case 2:
      loadTests(id,t,titleAdd);
      break;
  }



}

function loadPosts(id,snackbar,titleAdd){
  var xmlhttp = new XMLHttpRequest();
  var toSend = "contentid=" + id + "&option=1"; //Gets posts
  document.getElementById("modalTitle").innerHTML = titleAdd;

  var d1 = document.getElementById("modal-body")
  xmlhttp.open("POST", "/api/getSubjectContent", true); //TODO to POST LATER
  xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xmlhttp.send(toSend);
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4) {
      var serverResponse = JSON.parse(xmlhttp.responseText);
      $(snackbar[0]).snackbar("hide");

      d1.innerHTML = "";
      for (let i = 0; i < serverResponse[0].length; i++) {
        console.log("")
      }
      //d1.insertAdjacentHTML('beforeend',  serverResponse[0].content);
      $('#myModal').modal('show');
    }
  }
}


function loadTests(id,snackbar,titleAdd){
  var xmlhttp = new XMLHttpRequest();
  var toSend = "contentid=" + id + "&option=2"; //Gets tests/etc
  var title = document.getElementById("modalTitle")
  var d1 = document.getElementById("modal-body")
  xmlhttp.open("POST", "/api/getSubjectContent", true); //TODO to POST LATER
  xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xmlhttp.send(toSend);
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4) {
      var serverResponse = JSON.parse(xmlhttp.responseText);
      $(snackbar[0]).snackbar("hide");
      d1.innerHTML = "";
      title.innerHTML = "";
      title.innerHTML = serverResponse[0].title + " " + titleAdd;
      d1.insertAdjacentHTML('beforeend',  serverResponse[0].content);
      $('#myModal').modal('show');
    }
  }
}

function slider(toGet) {

  var doc = toGet.offsetParent.childNodes[3];

  if ($(doc).is(":hidden")) {
    $(doc).slideDown("fast", function () {

    });
  } else {
    $(doc).slideUp("fast", function () {

    });
  }



}