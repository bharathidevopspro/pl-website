function setMood(mood) {
  let message = document.getElementById("message");

  if (mood === "happy") {
    document.body.style.background = "#facc15";
    message.innerText = " Stay happy and keep smiling!";
  }

  else if (mood === "sad") {
    document.body.style.background = "#1e3a8a";
    message.innerText = "It's okay, better days are coming!";
  }

  else if (mood === "chill") {
    document.body.style.background = "#0f766e";
    message.innerText = " Relax and enjoy your time!";
  }
}
