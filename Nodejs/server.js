const express = require("express");
const app = express();
const dotenv = require("dotenv");
const { SerialPort } = require("serialport");
const sequelize = require("./configure/db");
const { sensors } = sequelize.models;

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
    //   if not connected change status to 0 we assume that w ehave only one sensor
    sensors.update({ status: 0 }, { where: { id: 1 } });
    return console.log("Error opening port: ", err.message);
  } else {
    sensors.update({ status: 0 }, { where: { id: 1 } });
  }

  // Because there's no callback to write, write errors will be emitted on the port:
  port.write("main screen turn on");
});

// The open event is always emitted
port.on("open", function () {
  // open logic
});

setInterval(() => {
  data = port.on("readable", function () {
    // save data to database
    // i don't know how the data will return so i just write example app
    sensors.update({ data: port.read(), status: 1 }, { where: { id: 1 } });
    console.log("Data:", port.read());
  });
  //   if no data change status to 0 we assume that w ehave only one sensor

  if (!data._readableState.reading) {
    sensors.update({ status: 0 }, { where: { id: 1 } });
  }
}, 3600000);
setInterval(() => {
  console.log(30);
}, 3000);

sequelize.sync({ alter: true }, console.log("database connected"));
app.listen(PORT, console.log(`Server running on port ${PORT}`));
