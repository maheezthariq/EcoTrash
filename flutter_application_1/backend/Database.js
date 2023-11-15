const mongoose = require('mongoose');


const DbConnection = ()=>{

    mongoose.connect('mongodb+srv://maheezmtm:Heemaz7786@cluster0.5bw9vp9.mongodb.net/EcoTrash1?retryWrites=true&w=majority')
    .then((con)=>console.log(`MongoDB is connected to the host :Eco Trash`))
    .catch((err)=>{
        console.log(err)
    })

}

module.exports = DbConnection   