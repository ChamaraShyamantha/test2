const express = require("express");
const mongoose = require("mongoose");
const User = require("../modules/users");
const jwt = require("jsonwebtoken");
const authentication = require("../middlewares/auth");
//const bcryptjs = require("bcryptjs");
const RouterAuthentication = express.Router();

RouterAuthentication.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password, address, contactNo } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    // const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      email,
      password,
      name,
      address,
      contactNo,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Sign In Route

RouterAuthentication.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }
 
    if (password != user.password) {
      return res.status(400).json({ msg: "Incorrect password." });
    }else{
      const token = jwt.sign({ id: user._id }, "passwordKey");
      return res.json({ 
        
        _id: user._doc['_id'],
        name: user._doc['name'],
        email: user._doc['email'],
        password: user._doc['password'],
        address: user._doc['address'],
        
        contactNo: user._doc['contactNo'].toString(),
        type: user._doc['type'],
        token: token,
        cart:user._doc['cart'],
  
      });
      
    }
   

  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

RouterAuthentication.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get user data

RouterAuthentication.get("/", authentication, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = RouterAuthentication;
