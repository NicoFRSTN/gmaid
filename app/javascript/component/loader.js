


const initLoader = () => {

  const bouton = document.querySelector('.sync-button-card')
  const spinner = document.querySelector('.fas')
  const text = document.querySelector('.sync-button-text')
  const shader = document.querySelector('#shader')

  console.log(bouton)


  document.addEventListener('ajax:before', () => {
    bouton.classList.toggle("active")
    spinner.classList.toggle('fa-spin')
    spinner.classList.toggle('fas-loading')
    text.classList.toggle('sync-button-text-loading')
    text.innerHTML="Synchronizing. Please wait..."
    shader.style.display='block'


  })
}

export default initLoader
