import express from "express";
import mongoose from "mongoose";
import bodyParser from "body-parser";
import cors from "cors";
import dotenv from "dotenv";
import publicRoutes from "../api/routes/publicRoutes";
import wasteCollectorRoutes from "../api/routes/wasteCollectorRoutes";

const app = express();
dotenv.config();

app.use(
  cors({
    origin: "*",
    credentials: true,
  })
);
app.use(bodyParser.json());

app.use(express.json());

var port = process.env.PORT || 6000;

mongoose.set("strictQuery", true);
mongoose
  .connect(process.env.MONGODB_URI!)
  .then(() => console.log("Connected to Database"))
  .catch((error) => console.error("Database connection error:", error));

app.use(bodyParser.urlencoded({ extended: true }));

app.use(bodyParser.json());
app.use("/uploads", express.static("uploads"));

app.use("/public", publicRoutes);
app.use("/auth/wasteCollector", wasteCollectorRoutes);

app.use(function (req, res) {
  res.status(404).send({ url: req.originalUrl + " not found" });
});

app.listen(port, () => {
  console.log(`Server started on: ${port}`);
});
