const initUpdateHeaderOnScroll = () => {
  const header = document.querySelector(".header");
  if (header) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 60) {
        header.classList.add('header-small');
      } else {
      header.classList.remove('header-small');
      }
    });
  }
}


export default initUpdateHeaderOnScroll;
