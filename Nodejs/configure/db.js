const { Sequelize } = require("sequelize");
const dotenv = require("dotenv");
dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USERNAME,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    dialect: process.env.DB_TYPE,

    operatorAliases: false,
    dialectOptions: {
      dateStrings: true,
      typeCast: true,
      timezone: process.env.TIME_ZONE,
    },

    timezone: process.env.TIME_ZONE,
    logging: false,
  }
);

const modelDefiners = [require("../models/sensors")];

//define all models according to their files.
for (const modelDefiner of modelDefiners) {
  modelDefiner(sequelize);
}

// We export the sequelize connection instance to be used around our app.
module.exports = sequelize;
