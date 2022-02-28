const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  sequelize.define("sensors", {
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
    },
    SensorName: {
      allowNull: false,
      type: DataTypes.STRING,
    },
    status: {
      allowNull: false,
      type: DataTypes.BOOLEAN,
    },
    data: {
      allowNull: false,
      type: DataTypes.STRING,
    },
  });
};
