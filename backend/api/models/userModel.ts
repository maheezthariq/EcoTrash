export interface IUser {
  name: string;
  role: UserRole;
  email: string;
  password: string;
  token?: string;
}

export enum UserRole {
  SUPER_ADMIN = "SUPER_ADMIN",
  WASTE_COLLECTOR = "WASTE_COLLECTOR",
  USER = "USER"
}