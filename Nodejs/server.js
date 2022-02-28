const express = require("express");
const app = express();
const dotenv = require("dotenv");
const { SerialPort } = require("serialport");
dotenv.config();
// port on it we run the node server
const PORT = process.env.PORT || 3000;

const port = new SerialPort({
  path: "/dev/tty-usbserial1",
  baudRate: 9600,
  autoOpen: false,
});

port.open(function (err) {
  if (err) {
    return console.log("Error opening port: ", err.message);
  }

  // Because there's no callback to write, write errors will be emitted on the port:
  port.write("main screen turn on");
});

// The open event is always emitted
port.on("open", function () {
  // open logic
});

setInterval(() => {
  port.on("readable", function () {
    console.log("Data:", port.read());
  });
}, 3000);
setInterval(() => {
  console.log(30);
}, 3000);
app.listen(PORT, console.log(`Server running on port ${PORT}`));
