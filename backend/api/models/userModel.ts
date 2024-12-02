export interface IUser {
  name: string;
  role: UserRole;
  email: string;
  password: string;
}

export enum UserRole {
  SUPER_ADMIN = "SUPER_ADMIN",
  SALES_REP = "SALES_REP",
}