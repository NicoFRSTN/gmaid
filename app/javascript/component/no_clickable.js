


const updateSubmitButton = () => {
  const checkboxes = Array.from(document.querySelectorAll("#messages_form input[type=checkbox]"))
  const btns = document.querySelectorAll("#messages_form input[type=submit]")

  if (checkboxes.find(checkbox => checkbox.checked)) {
    btns.forEach(btn => btn.classList.remove('disabled'))
  } else {
    btns.forEach(btn => btn.classList.add('disabled'))
  }
}

// const selectAll = () => {
//   const checkboxes = Array.from(document.querySelectorAll("#messages_form input[type=checkbox]"))
//   const buttonselectall = document.querySelectorAll(".selectall")

//   if (buttonselectall.find(buttonselectall.checked)) {
//     checkboxes.forEach(checkboxe => checkboxe.all)
//   } else {
//     console.log("salut")
//   }
// }

// const addButtonDisabledWhenClickSelectAll = () => {
//   const buttonselectall = document.querySelector('.selectall')
//   const btns = document.querySelectorAll("#messages_form input[type=submit]")

//   buttonselectall.addEventListener('click', (event) => {
//     event.preventDefault();
//     btns.classList.toggle('disabled');
//   })
// }





const initSelectAll = () => {
  const checkboxes = Array.from(document.querySelectorAll("#messages_form input[type=checkbox]"))
  const buttonselectall = document.querySelector('.selectall')
  const btns = document.querySelectorAll("#messages_form input[type=submit]")
  console.log(btns);
  buttonselectall.addEventListener('click', (event) => {
    event.preventDefault()
    btns.forEach(btn => btn.classList.toggle('disabled'));
    checkboxes.forEach((checkbox) => {
      if (checkbox.checked == false) {
        checkbox.checked = true;
        buttonselectall.innerHTML = "Unselect"
      }
      else {
        if (checkbox.checked == true) {
        checkbox.checked = false;
          buttonselectall.innerHTML = "Select all"
        }
      }
    })
  })
}


//   function checkAll(o) {
//     const checkboxes = Array.from(document.querySelectorAll("#messages_form input[type=checkbox]"));
//     for (let checkboxes = 0; checkboxes < checkboxes.length; checkboxes++) {
//       let obj = boxes[x];
//       if (obj.type == "checkbox") {
//         if (obj.name ! = "check")
//           obj.checked = o.checked;
//       }
//     }
//   }


const noClickable = () => {
  initSelectAll()
  const checkboxes = document.querySelectorAll("#messages_form input[type=checkbox]")
  const btns = document.querySelectorAll("#messages_form input[type=submit]")

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('change', updateSubmitButton)
  })
}

export default noClickable
// export default addButtonDisabledWhenClickSelectAll
