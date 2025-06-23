require("dotenv").config();

const prisma = require("../db");

exports.start_game_post = async (req, res, next) => {
  try {
    const mapData = await prisma.map.findUnique({
      where: {
        slug: req.params.slug,
      },
      select: {
        id: true,
      }
    });

    if (!mapData) {
      return res.status(404).json({ message: "Map not found." });
    }

    const mapId = mapData.id;

    const randomFindables = await prisma.$queryRaw`
      SELECT id, name, "imageUrl"
      FROM "Findable"
      WHERE "mapId" = ${mapId}
      ORDER BY RANDOM()
      LIMIT 3;
    `;

    const newGameSession = await prisma.gameSession.create({
      data: {
        mapId: mapId,
        assignedFindables: randomFindables,
      },
      include: {
        map: true,
      },
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
        slug: req.params.slug,
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
};

// req.params.mapId

// model GameSession {
//   id                  String @id @default (uuid())
//   map                 Map @relation(fields: [mapId], references: [id])
//   mapId               String
//   playerId            String
//   playerName          String ?
//     startTime           DateTime @default (now())
//   endTime             DateTime ?
//     durationSeconds     Int ?
//       assignedFindableIds String[]
//   foundFindableIds    String[]
// }

// const newGameSession = await prisma.gameSession.create({
//   data: {
//     mapId: mapId,
//     assignedFindables: randomFindables,
//   },
//   include: {
//     map: {
//       select: {
//         imageUrl: true,
//       }
//     }
//   }
// });