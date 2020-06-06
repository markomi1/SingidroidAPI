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

function rippleEffect2() {
  const letters = Array.from(document.querySelectorAll('.post-list'))

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


function toOpen(id, option, titleAdd) {
  var options = {
    content: "Ucitavanje...  <img src='/images/oval.svg' id='loader-icon' />  ",
    timeout: 0,
    htmlAllowed: true,
  }
  var t = $.snackbar(options);

  switch (option) {
    case 1:
      loadPosts(id, t, titleAdd)
      break;
    case 2:
      loadTests(id, t, titleAdd);
      break;
  }
}

function loadPosts(id, snackbar, titleAdd) {
  var xmlhttp = new XMLHttpRequest();
  var toSend = "contentid=" + id + "&option=1"; //Gets posts
  document.getElementById("contentModalTitle").innerHTML = titleAdd;

  var d1 = document.getElementById("contentModal-body");

  xmlhttp.open("POST", "/api/getSubjectContent", true); //TODO to POST LATER
  xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xmlhttp.send(toSend);
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4) {
      var serverResponse = JSON.parse(xmlhttp.responseText);
      $(snackbar[0]).snackbar("hide");

      d1.innerHTML = "";

      var toInsert = "<div class='list-group'>";
      for (let i = 0; i < serverResponse[0].length; i++) {
        toInsert += "<a onclick='getPost(" + serverResponse[0][i].postlinkid + ")' class='list-group-item list-group-item-action flex-column align-items-start'><div class='d-flex w-100 justify-content-between'>" +
          "<h6 class='mb-1 list-title'>" + serverResponse[0][i].title + "</h6><small class='text-muted'>" + getFormattedDate(serverResponse[0][i].datetime) + "</small></div><p class='mb-1'>" + serverResponse[0][i].teacherName + "</p></a><div class='list-line'></div>";
      }
      toInsert += "</div>";
      d1.insertAdjacentHTML('beforeend', toInsert);
      document.documentElement.style.setProperty('--z-index', "1050");
      $('#mainContentModal').modal('show');
    }
  }
}

function getPost(postid) {
  var xmlhttp = new XMLHttpRequest();
  var options = {
    content: "Ucitavanje...", // text of the snackbar
    style: "toast", // add a custom class to your snackbar
    timeout: 500, // time in milliseconds after the snackbar autohides, 0 is disabled
    htmlAllowed: true, // allows HTML as content value
  }
  var toSend = "postId=" + postid; //Gets a posts
  var t = $.snackbar(options);
  var d1 = document.getElementById("spareModal-body");
  xmlhttp.open("POST", "api/getPost", true);
  xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xmlhttp.send(toSend);
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4) {
      var serverResponse = JSON.parse(xmlhttp.responseText);
      //$(t[0]).snackbar("hide");

      d1.innerHTML = "";
      document.getElementById("spareModalTitle").innerHTML = serverResponse[0].title;
      document.getElementById("spareModalDate").innerHTML = serverResponse[0].teacher + " " + getFormattedDate(serverResponse[0].datetime / 1000);


      d1.insertAdjacentHTML('beforeend', serverResponse[0].content);

      if(serverResponse[0].content.length > 1000 && serverResponse[0].attachments.length != 0 ){
            document.getElementById("refs").innerHTML = "<a href=\"#attachemtnsHolder\">Idi do priloga</a>";
      }
      if (serverResponse[0].attachments != undefined) {
        addAttachments(serverResponse[0].attachments);
      }

     document.documentElement.style.setProperty('--z-index', "10");

     //document.getElementById("spareModal").style.zIndex = 10;
     $('#spareModal').modal('show');
   }
 }
 }

 $('#spareModal').on('hidden.bs.modal', function (e) { //Used to make background gray by dynamically changing CSS
   document.documentElement.style.setProperty('--z-index', "1060");
 })

function addAttachments(AttArray) {
  var arrSize = AttArray.length;
  var attachments = document.getElementById("attachmentsHolder");
  attachments.innerHTML = "";
  for (let i = 0; i < arrSize; i++) {
    attachments.insertAdjacentHTML("beforeend", "<li><span class='fp-filename-icon'>" +
      "<a href='" + AttArray[i].attachmentLink + "'>" +
      "<span class='fp-icon'><img class='icon ' alt='" + AttArray[i].attachmentTitle + "' title='" + AttArray[i].attachmentTitle + "' src='" + AttArray[i].type + "'>" +
      "</span><span class='fp-filename'>" + AttArray[i].attachmentTitle + "</span></a></span></li>");
  }
}


function getFormattedDate(unixtime) {
  var date = new Date(unixtime * 1000);

  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'Maj', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  var month = months[date.getMonth()];
  var day = date.getDate();
  var hour = date.getHours();
  var min = date.getMinutes();
  var sec = date.getSeconds();


  day = (day < 10 ? "0" : "") + day;
  hour = (hour < 10 ? "0" : "") + hour;
  min = (min < 10 ? "0" : "") + min;
  var str = day + " " + month + " " + date.getFullYear() + ", " + hour + ":" + min;

  return str;
}

function loadTests(id, snackbar, titleAdd) { //Gets list of tests
  var xmlhttp = new XMLHttpRequest();
  var toSend = "contentid=" + id + "&option=2"; //Gets tests/etc
  var title = document.getElementById("contentModalTitle");
  var d1 = document.getElementById("contentModal-body");
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
      d1.insertAdjacentHTML('beforeend', serverResponse[0].content);
      $('#mainContentModal').modal('show');
    }
  }
}

function slider(toGet) {

  var doc = toGet.offsetParent.childNodes[3];

  if ($(doc).is(":hidden")) {
    $(doc).slideDown("fast", function () {});
  } else {
    $(doc).slideUp("fast", function () {});
  }
}