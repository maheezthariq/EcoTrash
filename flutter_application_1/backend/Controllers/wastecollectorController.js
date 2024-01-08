const express = require('express');
const {generateAccessToken} = require('../helper');
const wastecollectorSchema = require('../Model/wastecollectormodel');

const router = express.Router();

router.post("/login", async (req, res) => {
    try {
      // Use await to get the actual result from the query
      const validData = wastecollectorSchema.findOne({ wastecollectorid: req.body.wastecollectorid });
      console.log(validData);
  
      if (!validData) {
        return res.status(400).json("Invalid wastecollector id");
      }
  
    //   const isPasswordValid = await bcrypt.compare(req.body.password, validData.UserPassword);
  
      if (req.body.wastecollectorpassword == validData.wastecollectorpassword) {
        const wastecollectorToken = generateAccessToken(validData);
        res.header('Authorization', `Bearer ${wastecollectorToken}`).json({ token: wastecollectorToken });
      } else {
        return res.status(400).json("Invalid password");
      }
    } catch (err) {
      return res.status(500).json(err.message || err);
    }
  });
  
  
  module.exports = router;