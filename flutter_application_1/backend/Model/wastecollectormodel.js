const mongoose = require('mongoose');
// const validator = require('validator');

const wastecollectorSchema = new mongoose.Schema({
    wastecollectorid: {
        type: String,
        required: [true, 'Please enter FullName']
    },
    wastecollectorpassword: {
        type: String,
        required: [true, 'Please enter UserName']
    },
    
   
})


module.exports = mongoose.model('wastecollectordata', wastecollectorSchema)