


const initLoader = () => {

  const bouton = document.querySelector('.sync-button-card')
  const spinner = document.querySelector('.fas')
  const text = document.querySelector('.sync-button-text')

  console.log(bouton)


  bouton.addEventListener('click', () => {
    bouton.classList.toggle("active")
    spinner.classList.toggle('fa-spin')
    spinner.classList.toggle('fas-loading')
    text.classList.toggle('sync-button-text-loading')
    text.innerHTML="Synchronizing. Please wait..."


  })
}

export default initLoader
