

function updateSlider(slideAmount) {
  //get the element
  var displayValue = document.getElementById("chosen_value");
  //show the amount
  console.log("IN updateSlider:  - slideAmount = " + slideAmount );
  displayValue.innerHTML = slideAmount;

  //get the element
  var pic = document.getElementById("pic");
  //set the dimensions
  //   pic.style.width = slideAmount + "%";
  //   pic.style.height = slideAmount + "%";
  // return slideAmount;
}
