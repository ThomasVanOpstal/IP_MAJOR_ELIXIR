function showLinks() {
    var links = document.getElementById("navbar-default");
    if (links.style.display === "none !important") {
      links.style.display = "block !important";
    } else {
      links.style.display = "none !important";
    }
  }