const { Player } = require("../models/PlayerModel");
const { User } = require("../models/UserModel");
//done

exports.registerUser = (req, res) => {
  const user = new Player(req.body);

  user
    .save()
    .then(() => {
      const log = new User({
        email: req.body.email,
        password: req.body.password,
        role: "player",
        profile_pic: req.body.profile_pic,
      });
      log
        .save()
        .then(() => {
          return res.status(200).json({
            success: true,
            message: "Successfully Signed Up!",
          });
        })
        .catch((err) => {
          return res.status(422).json({
            success: false,
            message: "Please enter unique nic & mobile no & email!",
            data: err,
          });
        });
    })
    .catch((err) => {
      return res.status(422).json({
        success: false,
        message: "Please enter unique nic & mobile no & email!",
        data: err,
      });
    });
};

exports.loginUser = (req, res) => {
  User.findOne({ email: req.body.email })
    .then((user) => {
      if (!user) {
        return res
          .status(404)
          .json({ success: false, message: "User email not found!" });
      } else {
        if (req.body.password == user.password) {
          user.generateToken((err, token) => {
            if (err) {
              return res.status(400).send({ success: false, message: err });
            } else {
              res.status(200).json({
                success: true,
                message: `Successfully Logged In`,
                data: {
                  token: token,
                  role: user.role,
                },
              });
            }
          });
        } else {
          return res.status(400).json({
            success: false,
            message: "Your password is wrong. Please check again!",
          });
        }
      }
    })
    .catch((err) => {
      return res.status(200).json({
        success: true,
        message: "Login attempt failed!",
        data: err,
      });
    });
};

exports.getUserDetails = (req, res) => {
  res.json({ status: true, message: "User Received!", data: req.user });
};
