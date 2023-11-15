const express = require('express');
const bcrypt = require('bcryptjs');
const { hashPassword,generateAccessToken} = require('../helper');
const signUpSchema = require('../Model/SignUpModel');

const router = express.Router();

// Registration Route
router.post("/Signup", async (req, res) => {
  try {
    console.log(req.body);
    const existEmail = await signUpSchema.findOne({ UserEmail: req.body.email });

    if (existEmail) {
      return res.status(400).json("Email already exists");
    }

    const hashPwd = await hashPassword(req.body.password);

    const signUpData = new signUpSchema({
      Name: req.body.name,
      UserName: req.body.userName,
      UserEmail: req.body.email,
      UserPassword: hashPwd
    });

    const postUser = await signUpData.save();

    if (postUser) {
      return res.status(200).json("Registered successfully");
    }
  } catch (err) {
    if (err.code === 11000) {
      return res.status(400).json("Duplicate key found");
    }
    return res.status(400).json(err.message || err);
  }
});

// Login Route
router.post("/login", async (req, res) => {
  try {
    // Use await to get the actual result from the query
    const validData = await signUpSchema.findOne({ UserEmail: req.body.email });
    console.log(validData);

    if (!validData) {
      return res.status(400).json("Invalid email");
    }

    const isPasswordValid = await bcrypt.compare(req.body.password, validData.UserPassword);

    if (isPasswordValid) {
      const userToken = generateAccessToken(validData);
      res.header('Authorization', `Bearer ${userToken}`).json({ token: userToken });
    } else {
      return res.status(400).json("Invalid password");
    }
  } catch (err) {
    return res.status(500).json(err.message || err);
  }
});


module.exports = router;
