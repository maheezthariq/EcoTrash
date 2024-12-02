import express from "express";
import { just } from "../controllers/wasteCollectorController";
import { authenticateJWT } from "../middleware/authMiddleware";

const router = express.Router();

router.post("/just", authenticateJWT, just);


export default router;
