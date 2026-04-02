const express = require("express");
const router = express.Router();
const User = require("../models/user");
router.post("/save-profile", async (req, res) => {
  console.log("🔥 API HIT");
  console.log(req.body);

  try {
    const { phone, name, email, emergency, role } = req.body;

    let user = await User.findOne({ phone });

    if (user) {
      user.name = name;
      user.email = email;
      user.emergency = emergency;
      user.role = role;
      await user.save();
    } else {
      user = new User({ phone, name, email, emergency, role });
      await user.save();
    }

    res.json({ success: true, user });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ✅ GET USER
router.get("/get-user/:phone", async (req, res) => {
  try {
    const user = await User.findOne({ phone: req.params.phone });
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;