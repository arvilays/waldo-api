require("dotenv").config();

const prisma = require("../db");

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
      where: {
        nameShort: req.params.nameShort,
      },
      include: {
        findables: true,
      },
    });

    if (!map) {
      return res.status(404).json({ error: "Map not found." });
    }

    res.status(200).json(map);
  } catch (err) {
    next(err);
  }
}

// req.params.mapId