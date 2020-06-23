'use strict';

let OPENED_MODALS = [];

const GLOBAL_AXIOS_CONFIG = {
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded'
  }
}

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

function onLoadAction() {
  let buttons = document.getElementsByClassName("btn-raised");
  for (let i = 0; i < buttons.length; i++) {
    if (buttons[i].getAttribute("data-linkid") == 0) {
      buttons[i].classList.add("disabled");
    }
  }
}


function toOpen(id, option, titleAdd) {
  let t;
  let options = {
    content: "Ucitavanje...  <img alt='Loader' src='/images/oval.svg' id='loader-icon' />  ",
    timeout: 0,
    htmlAllowed: true
  };

  if (id === 0) {
    options = {
      content: "Kategorija je iskljucena",
      timeout: 1000,
      htmlAllowed: true
    };
    $.snackbar(options);
    return;
  }
  t = $.snackbar(options);

  switch (option) {
    case 1:
      loadPosts(id, t, titleAdd);
      break;
    case 2:
      loadTests(id, t, titleAdd);
      break;
  }
}

function checkID(id) {
  let options = {
    content: "Ucitavanje...  <img alt='Loader' src='/images/oval.svg' id='loader-icon' />  ",
    timeout: 0,
    htmlAllowed: true
  };
  if (id === 0) {
    options = {
      content: "Kategorija je iskljucena",
      timeout: 1000,
      htmlAllowed: true
    };
    $.snackbar(options);
    return null;
  }
  return $.snackbar(options);
}

function getPosts(id, titleAdd) {
  let t = checkID(id)
  if (t == null) {
    return
  }
  loadPosts(id, t, titleAdd);
}

function getFolders(id, titleAdd) {
  let t = checkID(id)
  if (t == null) {
    return
  }
  loadTestFolder(id, t, titleAdd);
}


function errorSnackbar() {
  let options = {
    content: "Greška prilikom učitavanja!",
    timeout: 5000,
    style: "error-snackbar",
    htmlAllowed: true
  };
  $.snackbar(options);
}


function loadPosts(id, snackbar, titleAdd) {

  document.getElementById("contentModalTitle").innerHTML = titleAdd;

  let d1 = document.getElementById("contentModal-body");

  const params = new URLSearchParams();
  params.append('contentid', id);
  axios.post('/api/getSubjectContent', params, GLOBAL_AXIOS_CONFIG)
      .then(function (response) {
        let serverResponse = response.data;
        $(snackbar[0]).snackbar("hide");

        d1.innerHTML = "";

        let toInsert = "<div class='list-group'>";
        for (let i = 0; i < serverResponse[0].length; i++) {
          toInsert += "<a onclick='getPost(" + serverResponse[0][i].postlinkid + ")' class='list-group-item list-group-item-action flex-column align-items-start'><div class='d-flex w-100 justify-content-between'>" +
              "<h6 class='mb-1 list-title'>" + serverResponse[0][i].title + "</h6><small class='text-muted'>" + getFormattedDate(serverResponse[0][i].datetime) + "</small></div><p class='mb-1'>" + serverResponse[0][i].teacherName + "</p></a><div class='list-line'></div>";
        }
        toInsert += "</div>";
        d1.insertAdjacentHTML('beforeend', toInsert);
        document.documentElement.style.setProperty('--z-index', "1050");
        let modal = $('#mainContentModal');

        OPENED_MODALS.push(modal[0].id); //Pushes modal ID onto the stack
        try {
          window.JSInterface.modalNumber(OPENED_MODALS.length);
        } catch (e) {
          console.log("Android interface not found")
        }

        modal.modal('show');

      }).catch(function (error) {
    console.log(error);
    $(snackbar[0]).snackbar("hide");
    errorSnackbar();
  });
}

function hideTopMostModal() {
  let length = OPENED_MODALS.length;
  console.log("Hide called")
  if (length > 0) {
    let modalID = OPENED_MODALS[length - 1];
    $("#" + modalID).modal("hide");
    try {
      window.JSInterface.backPressed(true); //Means that it popped a modal from the stack

    } catch (e) {
      console.log("Android interface not found")
    }

  } else {
    try {
      window.JSInterface.backPressed(false); //Means there are no more modals to pop
    } catch (e) {
      console.log("Android interface not found")
    }
  }

}

$("#mainContentModal").on('hide.bs.modal', function () {
  OPENED_MODALS.pop();
  try {
    window.JSInterface.modalNumber(OPENED_MODALS.length);
  } catch (e) {
    console.log("Android interface not found")
  }

  console.log("MainContentModal popped " + OPENED_MODALS);
});

$('#spareModal').on('hidden.bs.modal', function () { //Used to make background gray by dynamically changing CSS
  document.documentElement.style.setProperty('--z-index', "1060");
  OPENED_MODALS.pop();
  try {
    window.JSInterface.modalNumber(OPENED_MODALS.length);
  } catch (e) {
    console.log("Android interface not found");
  }
  console.log("SpareModal popped " + OPENED_MODALS);
})


function getPost(postid) {
  let options = {
    content: "Ucitavanje...", // text of the snackbar
    style: "toast", // add a custom class to your snackbar
    timeout: 0, // time in milliseconds after the snackbar autohides, 0 is disabled
    htmlAllowed: true, // allows HTML as content value
  };
  let t = $.snackbar(options);
  let d1 = document.getElementById("spareModal-body");
  const params = new URLSearchParams();
  params.append('postId', postid);
  axios.post('/api/getPost', params, GLOBAL_AXIOS_CONFIG)
      .then(function (response) {
        let serverResponse = response.data;

        $(t[0]).snackbar("hide");

        d1.innerHTML = "";
        document.getElementById("spareModalTitle").innerHTML = serverResponse[0].title;
        document.getElementById("spareModalDate").innerHTML = serverResponse[0].teacher + " " + getFormattedDate(serverResponse[0].datetime / 1000);


        d1.insertAdjacentHTML('beforeend', serverResponse[0].content);

        if (serverResponse[0].content.length > 1000 && serverResponse[0].attachments.length !== 0) {
          document.getElementById("refs").innerHTML = "<a href='#attachemtnsHolder'>Idi do priloga</a>";
        }
        if (serverResponse[0].attachments !== undefined) {
          addAttachments(serverResponse[0].attachments);
        }

        document.documentElement.style.setProperty('--z-index', "10");
        let modal = $('#spareModal');
        OPENED_MODALS.push(modal[0].id);
        try {
          window.JSInterface.modalNumber(OPENED_MODALS.length);
        } catch (e) {
          console.log("Android interface not found");
        }
        modal.modal('show');
      }).catch(function (error) {
    console.log(error);
    $(snackbar[0]).snackbar("hide");
    errorSnackbar();
  });
}





function addAttachments(AttArray) {
  let arrSize = AttArray.length;
  let attachments = document.getElementById("attachmentsHolder");
  attachments.innerHTML = "";
  for (let i = 0; i < arrSize; i++) {
    attachments.insertAdjacentHTML("beforeend", "<li><span class='fp-filename-icon'>" +
        "<a href='" + AttArray[i].attachmentLink + "'>" +
        "<span class='fp-icon'><img class='icon ' alt='" + AttArray[i].attachmentTitle + "' title='" + AttArray[i].attachmentTitle + "' src='" + AttArray[i].type + "'>" +
        "</span><span class='fp-filename'>" + AttArray[i].attachmentTitle + "</span></a></span></li>");
  }
}


function loadTestFolder(id, snackbar, titleAdd) { //Gets list of tests

  let title = document.getElementById("contentModalTitle");
  let d1 = document.getElementById("contentModal-body");

  const params = new URLSearchParams();
  params.append('contentid', id);

  axios.post('/api/getTestFolder', params, GLOBAL_AXIOS_CONFIG)
      .then(function (response) {
        let serverResponse = response.data;
        $(snackbar[0]).snackbar("hide");
        d1.innerHTML = "";
        title.innerHTML = "";
        title.innerHTML = serverResponse[0].title + " " + titleAdd;
        d1.insertAdjacentHTML('beforeend', serverResponse[0].content);
        document.documentElement.style.setProperty('--z-index', "1050");
        let modal = $('#mainContentModal');

        OPENED_MODALS.push(modal[0].id); //Pushes modal ID onto the stack
        try {
          window.JSInterface.modalNumber(OPENED_MODALS.length);
        } catch (e) {
          console.log("Android interface not found");
        }

        modal.modal('show');

      }).catch(function (error) {
    console.log(error);
    $(snackbar[0]).snackbar("hide");
    errorSnackbar();
  });
}


function slider(toGet) {

  let doc = toGet.offsetParent.childNodes[3];

  if ($(doc).is(":hidden")) {
    $(doc).slideDown("fast", function () {
    });
  } else {
    $(doc).slideUp("fast", function () {
    });
  }
}


function getFormattedDate(unixtime) {
  let date = new Date(unixtime * 1000);

  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'Maj', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  let month = months[date.getMonth()];
  let day = date.getDate();
  let hour = date.getHours();
  let min = date.getMinutes();

  day = (day < 10 ? "0" : "") + day;
  hour = (hour < 10 ? "0" : "") + hour;
  min = (min < 10 ? "0" : "") + min;
  return day + " " + month + " " + date.getFullYear() + ", " + hour + ":" + min;
}


function getTeacherSchedule(teach) {
  let options = {
    content: "Ucitavanje...", // text of the snackbar
    style: "toast", // add a custom class to your snackbar
    timeout: 0, // time in milliseconds after the snackbar autohides, 0 is disabled
    htmlAllowed: true, // allows HTML as content value
  };
  let t = $.snackbar(options);
  let title = document.getElementById("contentModalTitle");
  let d1 = document.getElementById("contentModal-body");

  const params = new URLSearchParams();
  var filtered = teach.replace("Profesor: ", "");
  filtered = filtered.replace("Asistent: ", "");

  params.append('name', filtered);

  axios.post('/api/schedule', params, GLOBAL_AXIOS_CONFIG)
      .then(function (response) {
        let serverResponse = response.data;
        $(t[0]).snackbar("hide");
        d1.innerHTML = "";
        title.innerHTML = "";
        title.innerHTML = serverResponse[0].teacher + " Raspored";

        var header = "<table class=\"table table-borderless\">"
            + "<thead><tr><th class=\"colum-name\"scope=\"col\">Ime i prezime</th><th class=\"colum-name\"scope=\"col\">Predmeti</th>"
            + "<th class=\"colum-name\"scope=\"col\">Dan</th><th class=\"colum-name\"scope=\"col\">Od</th><th class=\"colum-name\"scope=\"col\">Do</th>"
            + "<th class=\"colum-name\"scope=\"col\">Prostorija</th></tr></thead>";
        for (let i = 0; i < serverResponse.length; i++) {
          var list = makeListOfSubjects(serverResponse[i].subjects)
          header += "<tbody>"
              + "<tr><td><a>" + serverResponse[i].teacher + "</a></td><td><ul>" + list + "</ul></td><td><a>" + serverResponse[i].day + "</a></td>"
              + "<td><a>" + serverResponse[i].from + "</a></td><td><a>" + serverResponse[i].till + "</a></td><td><a>" + serverResponse[i].room + "</a></td></tr></tbody>";
        }
        header += "</table>"
        d1.insertAdjacentHTML("beforeend", header);

        document.documentElement.style.setProperty('--z-index', "1050");
        let modal = $('#mainContentModal');

        OPENED_MODALS.push(modal[0].id); //Pushes modal ID onto the stack
        try {
          window.JSInterface.modalNumber(OPENED_MODALS.length);
        } catch (e) {
          console.log("Android interface not found");
        }

        modal.modal('show');

      }).catch(function (error) {
    console.log(error);
    $(t[0]).snackbar("hide");
    errorSnackbar();
  });
}

function makeListOfSubjects(data) {
  var toReturn = "";
  for (let i = 0; i < data.length; i++) {
    toReturn += "<li>" + data[i] + "</li>";
  }
  return toReturn;
}