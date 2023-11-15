const bcrypt = require('bcryptjs')
const dotenv = require('dotenv')
const jwt = require('jsonwebtoken')

dotenv.config();
const SALT_ROUNDS = 10;

const hashPassword = async (password) => {
    const salt = await bcrypt.genSalt(SALT_ROUNDS);
    return bcrypt.hash(password, salt);
  };
  

  


  function generateAccessToken(validData) {
    const payload = {
      UserName: validData.UserName,
      UserEmail: validData.UserEmail
    };
    
    const secret = 'Hi MALINI I AM KRISHNAN';
    const options = { expiresIn: '1h' };
  
    return jwt.sign(payload, secret, options);
  }
  
  function verifyAccessToken(token) {
    const secret = 'Hi MALINI I AM KRISHNAN';
  
    try {
      const decoded = jwt.verify(token, secret);
      return { success: true, data: decoded };
    } catch (error) {
      return { success: false, error: error.message };
    }
  }
  
  function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
  
    if (!token) {
      return res.sendStatus(401);
    }
  
    const result = verifyAccessToken(token);
  
    if (!result.success) {
      return res.status(403).json({ error: result.error });
    }
  
    req.user = result.data;
    next();
  }
  
  module.exports= { hashPassword, authenticateToken, verifyAccessToken ,generateAccessToken};
  