const initUpdateHeaderOnScroll = () => {
  const header = document.querySelector(".header");
  console.log(header);
  if (header) {
    window.addEventListener('scroll', () => {
      console.log(window.scrollY);
      // console.log(window.inneHeight);
      if (window.scrollY >= 60) {
        header.classList.add('header-small');
      } else {
      header.classList.remove('header-small');
      }
    });
  }
}


export default initUpdateHeaderOnScroll;
