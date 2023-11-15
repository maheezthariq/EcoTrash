const mongoose = require('mongoose');
// const validator = require('validator');

const UserSchema = new mongoose.Schema({
    Name: {
        type: String,
        required: [true, 'Please enter FullName']
    },
    UserName: {
        type: String,
        required: [true, 'Please enter UserName']
    },
    UserEmail: {
        type: String,
        required: [true, 'Please enter Email'],
        unique:true,
    },
    UserPassword: {
        type: String,
        required: [true, 'Please enter Password'],
        unique:true
    },
    UserType: {
        type: String,
        required: true,
        default: 'User' 
    },
   
})


module.exports = mongoose.model('UserData', UserSchema)