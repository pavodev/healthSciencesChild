document.addEventListener('DOMContentLoaded', () => {
  const navContainerNotLogged = document.querySelectorAll('.navigation__container--user.notlogged');

  if (navContainerNotLogged && navContainerNotLogged.length > 0) {
    navContainerNotLogged[0].style.marginLeft = 'auto';
  }

  // Nav-link bottom animation

  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('mouseenter', () => {
      const siblingBar = link.parentElement.querySelector(':scope > .bottom_bar0');
      if (siblingBar) siblingBar.classList.add('active');
    });

    link.addEventListener('mouseleave', () => {
      const siblingBar = link.parentElement.querySelector(':scope > .bottom_bar0');
      if (siblingBar) siblingBar.width.remove('active');
    });
  });

  function setLogoBarWidthOld() {
    var e;
    $(".logo_text0").length && $(".logo_bar0").length && (e = (e = $(".logo_text0")).offset().left + e.width(), $(".logo_bar0").width(e))
  }

  function setLogoBarWidth() {
    const logoText = document.querySelector('#usi-nome-link');
    const logoBar = document.querySelector('.logo_bar0');

    if (logoText && logoBar) {
      const rect = logoText.getBoundingClientRect();
      const offsetLeft = rect.left + window.scrollX;
      const width = rect.width;

      logoBar.style.width = `${offsetLeft + width}px`;
    }
  }

  // Run on load
  window.addEventListener('DOMContentLoaded', setLogoBarWidth);

  // Run on resize
  window.addEventListener('resize', setLogoBarWidth);
})
