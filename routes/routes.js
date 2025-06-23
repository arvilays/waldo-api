const express = require("express");
const router = express.Router();
const controller = require("../controllers/controller");

router.post("/game/start/:slug", controller.start_game_post);
// router.post("/game/check-findable", controller);

// router.patch("/game/finish/:gameSessionId", controller);

router.get("/maps/", controller.map_get_all);
router.get("/maps/:slug", controller.map_get_one);
// router.get("/leaderboard/:mapId", controller);

module.exports = router;