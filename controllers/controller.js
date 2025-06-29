require("dotenv").config();
const prisma = require("../db");
const filter = require("leo-profanity");

exports.start_game_post = async (req, res, next) => {
  try {
    const mapData = await prisma.map.findUnique({
      where: { slug: req.params.slug },
      select: { id: true },
    });

    if (!mapData) return res.status(404).json({ message: "Map not found." });

    const randomFindables = await prisma.$queryRaw`
      SELECT id, name, "imageUrl", "coordinateX", "coordinateY"
      FROM "Findable"
      WHERE "mapId" = ${mapData.id}
      ORDER BY RANDOM()
      LIMIT 3;
    `;

    const newGameSession = await prisma.gameSession.create({
      data: {
        mapId: mapData.id,
        assignedFindables: randomFindables,
      },
      include: { map: true },
    });

    res.status(201).json({
      gameSessionId: newGameSession.id,
      map: newGameSession.map,
      assignedFindables: newGameSession.assignedFindables,
    });
  } catch (err) {
    next(err);
  }
};

exports.findable_post_check = async (req, res, next) => {
  const { gameSessionId, coordinateX, coordinateY } = req.params;

  const x = parseFloat(coordinateX);
  const y = parseFloat(coordinateY);

  if (isNaN(x) || isNaN(y)) {
    return res.status(400).json({ message: "Invalid coordinates provided." });
  }

  try {
    const session = await prisma.gameSession.findUnique({
      where: { id: gameSessionId },
      select: {
        assignedFindables: true,
        foundFindables: true,
        startTime: true,
      },
    });

    if (!session) return res.status(404).json({ message: "Game session not found." });

    const radius = 40;
    let matchedFindable = null;

    for (const f of session.assignedFindables) {
      if (session.foundFindables.includes(f.id)) continue;

      const dx = f.coordinateX - x;
      const dy = f.coordinateY - y;
      const distance = Math.sqrt(dx * dx + dy * dy);

      if (distance <= radius) {
        matchedFindable = f;
        break;
      }
    }

    if (!matchedFindable) {
      return res.status(200).json({
        status: "miss",
        message: "No findable found at the provided coordinates.",
      });
    }

    let updatedSession = await prisma.gameSession.update({
      where: { id: gameSessionId },
      data: {
        foundFindables: { push: matchedFindable.id },
      },
    });

    const allFound = updatedSession.foundFindables.length >= session.assignedFindables.length;

    if (allFound) {
      const endTime = new Date();
      const startTime = new Date(session.startTime);
      const durationMilliseconds = endTime - startTime;

      updatedSession = await prisma.gameSession.update({
        where: { id: gameSessionId },
        data: {
          endTime,
          durationMilliseconds,
          completed: true,
        },
      });
    }

    res.status(200).json({
      status: "found",
      message: "Findable successfully found and recorded!",
      findableName: matchedFindable.name,
      findableId: matchedFindable.id,
      allFound,
      gameSession: {
        id: updatedSession.id,
        foundFindables: updatedSession.foundFindables,
        durationMilliseconds: updatedSession.durationMilliseconds,
      },
    });
  } catch (error) {
    console.error("Error in findable_post_check:", error);
    res.status(500).json({ message: "An internal server error occurred." });
  }
};

exports.map_get_all = async (req, res, next) => {
  try {
    const maps = await prisma.map.findMany();
    res.status(200).json(maps);
  } catch (err) {
    next(err);
  }
};

exports.map_get_one = async (req, res, next) => {
  try {
    const map = await prisma.map.findUnique({
      where: { slug: req.params.slug },
      include: { findables: true },
    });

    if (!map) return res.status(404).json({ error: "Map not found." });

    res.status(200).json(map);
  } catch (err) {
    next(err);
  }
};

exports.leaderboard_get = async (req, res, next) => {
  const slug = req.params.slug;

  try {
    const leaderboard = await prisma.gameSession.findMany({
      where: {
        map: { is: { slug } },
        playerName: { not: null },
        durationMilliseconds: { not: null },
        completed: true,
      },
      orderBy: { durationMilliseconds: "asc" },
      select: {
        playerName: true,
        durationMilliseconds: true,
      },
      take: 100,
    });

    res.status(200).json({ leaderboard });
  } catch (error) {
    console.error("Leaderboard fetch error:", error);
    res.status(500).json({ message: "Failed to load leaderboard." });
  }
};

exports.leaderboard_post = async (req, res, next) => {
  const { gameSessionId, name } = req.params;

  if (!name || name.length > 32) {
    return res.status(400).json({ message: "Invalid name" });
  }

  if (filter.check(name)) {
    return res.status(400).json({ message: "Inappropriate name detected." });
  }

  try {
    await prisma.gameSession.update({
      where: { id: gameSessionId },
      data: { playerName: name },
    });

    res.status(200).json({
      status: "ok",
      message: "Player name added to game session.",
    });
  } catch (error) {
    console.error("Leaderboard submission error:", error);
    res.status(500).json({ message: "Server error submitting name." });
  }
};

exports.cleanup_post = async (req, res, next) => {
  const password = req.params.password;

  if (password !== process.env.PASSWORD) {
    return res.status(400).json({ message: "Unauthorized."});
  }
  
  try {
    await prisma.gameSession.deleteMany({
      where: { 
        playerName: null,
      },
    })

    return res.status(200).json({ message: "Cleanup complete." });
  } catch (error) {
    res.status(500).json({ message: "Cleanup failed." });
  }
}