import { Request, Response } from "express";
import User from "../schemas/userSchema";
import bcrypt from "bcryptjs";

const just = async (req: Request, res: Response) => {
  try {
    const { name, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 12);
    const user = new User({ name: name, email:email, password: hashedPassword });
    await user.save();
    res.send({ success: true, message: "User created" });
  } catch (error) {
    res.send({ success: false, message: "An unknown error occurred" });
  }
};


export { just };
