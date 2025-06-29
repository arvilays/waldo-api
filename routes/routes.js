const express = require("express");
const router = express.Router();
const controller = require("../controllers/controller");

// --- Game Routes ---
router.post("/game/start/:slug", controller.start_game_post); 
router.post(
  "/game/findable-check/:gameSessionId/:coordinateX/:coordinateY",
  controller.findable_post_check
);

// --- Leaderboard Routes ---
router.get("/leaderboard/:slug", controller.leaderboard_get); 
router.post("/leaderboard/:gameSessionId/:name", controller.leaderboard_post); 

// --- Map Routes ---
router.get("/maps", controller.map_get_all); 
router.get("/maps/:slug", controller.map_get_one); 

// --- Admin Routes ---
router.delete("/cleanup/:password", controller.cleanup_post);

module.exports = router;