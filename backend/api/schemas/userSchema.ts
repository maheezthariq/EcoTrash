import mongoose, { Schema } from "mongoose";
import { IUser, UserRole } from "../models/userModel";

const userSchema = new Schema<IUser>({
  name: {
    type: String,
    required: true,
  },
  role: {
    type: String,
    required: true,
    default: UserRole.USER
  },
  email: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    lowercase: true,
  },
  password: {
    type: String,
    required: true,
  },
});

const User = mongoose.model<IUser>("User", userSchema);

export default User;
