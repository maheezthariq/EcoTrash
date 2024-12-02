import { Request, Response } from "express";
import User from "../schemas/userSchema";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

const signup = async (req: Request, res: Response) => {
  try {
    const { name, email, password, role } = req.body;
    const hashedPassword = await bcrypt.hash(password, 12);
    const user = new User({ name: name, email:email, password: hashedPassword, role: role });
    await user.save();
    res.send({ success: true, message: "User created" });
    
  } catch (error) {
    res.send({ success: false, message: "An unknown error occurred" });
  }
};

const login = async (req: Request, res: Response) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.send({ success: false, message: "User not found" });
    }
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.send({ success: false, message: "Invalid password" });
    }
    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET!);
    res.send({
      success: true,
      token: token,
      _id: user._id,
      role: user.role,
      name: user.name,
      email: user.email,
    });
  } catch (error) {
    res.send({ success: false, message: "An unknown error occurred" });
  }
};

const logout = async (req: Request, res: Response) => {
  try {
    // Typically, for token-based auth, there's no server-side storage of tokens to invalidate.
    // Logout functionality usually involves clearing the token from the client-side (e.g., local storage).
    // Here, you might clear the token from the client-side or session if using session-based auth.
    res.send({ success: true, message: "Logged out successfully" });
  } catch (error) {
    res.send({ success: false, message: "An error occurred during logout" });
  }
};

export { signup, login, logout };
