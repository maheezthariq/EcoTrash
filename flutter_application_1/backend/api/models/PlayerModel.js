var mongoose = require("mongoose");
var bcrypt = require("bcrypt");
require("dotenv").config();
const jwt = require("jsonwebtoken");

const SALT = 10;

var Schema = mongoose.Schema;

var UserSchema = new Schema({
  name: {
    type: String,
    required: [true, "Name field is required!"],
    maxlength: 100,
  },

  mobile: {
    type: String,
    required: [true, "Mobile number field is required!"],
    maxlength: 200,
    unique: true,
  },
  email: {
    type: String,
    required: [true, "Email field is required!"],
    unique: true,
  },

  created_date: {
    type: Date,
    maxlength: 200,
    default: Date.now,
  },
});

const Player = mongoose.model("user_details", UserSchema);
module.exports = { Player };
