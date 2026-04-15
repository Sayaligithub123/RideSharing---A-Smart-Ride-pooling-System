const express = require("express");
const router = express.Router();
const User = require("../models/user");

/// 🔥 SAVE PROFILE
router.post("/save-profile", async (req, res) => {
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


/// ✅ ADD THIS HERE (STEP 2)
router.get("/get-user/:phone", async (req, res) => {
  try {
    console.log("📥 Fetch user API hit");

    const user = await User.findOne({
      phone: req.params.phone,
    });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;