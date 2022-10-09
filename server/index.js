const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./middlewares/admin");


const RouterAuthentication = require("./routes/authentication");

const productRouter = require("./routes/product");
const userRouter = require("./routes/user");


const PORT = process.env.PORT || 3000;
const medic = express();
const DB = "mongodb+srv://chamara:LgnKJi8r3bT4qyob@cluster0.lvyozim.mongodb.net/?retryWrites=true&w=majority";


medic.use(express.json());
medic.use(RouterAuthentication);
medic.use(adminRouter);
medic.use(productRouter);
medic.use(userRouter);


mongoose
    .connect(DB)
    .then(() => {
        console.log("Connected Successfully");
    })
    .catch((e) => {
        console.log(e);
    });

medic.listen(PORT, () => {
    console.log(`connected to the port ${PORT}`);
});