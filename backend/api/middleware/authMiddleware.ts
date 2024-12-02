import jwt from "jsonwebtoken";
import { Response, NextFunction } from "express";
import User from "../schemas/userSchema";

export const authenticateJWT = async (
  req: any,
  res: Response,
  next: NextFunction
) => {
  const token = req.header("Authorization")?.replace("Bearer ", "");
  if (!token) {
    return res.status(401).send({
      success: false,
      error: "Access denied. No token provided.",
    });
  }

  try {
    const decodedUser: any = jwt.verify(token, process.env.JWT_SECRET!);
    const user = await User.findById(decodedUser.userId);
    
    if (!user) {
      return res.status(401).send({ success: false, error: "Invalid token." });
    }

    req.user = user;
    next();
  } catch (ex) {
    return res.status(401).send({ success: false, error: "Invalid token." });
  }
};
