const initClickable = () => {

  const div = document.querySelector('.main-cards')
  const target = document.querySelector('.mail-link')

  console.log(div)


  div.addEventListener('click', () => {
    eventFire(target, 'click');


  })
}

export default initClickable
