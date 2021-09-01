


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

const selectallcheckboxe = () => {
  const checkboxes = Array.from(document.querySelectorAll("#messages_form input[type=checkbox]"))
  const buttonselectall = document.querySelector('.selectall')
    console.log("je suis la")
    for (let checkbox of checkboxes) {
      checkbox.checked = this.checked;
    }
  }



const noClickable = () => {
  const checkboxes = document.querySelectorAll("#messages_form input[type=checkbox]")
  const btns = document.querySelectorAll("#messages_form input[type=submit]")

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('change', updateSubmitButton, selectallcheckboxe)
  })
}

export default noClickable
