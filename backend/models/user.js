const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  phone: { type: String, required: true, unique: true },
  name: String,
  email: String,
  emergency: String,
  role: String,
}, { timestamps: true });

module.exports = mongoose.model("User", UserSchema);