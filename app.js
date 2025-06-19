require("dotenv").config();

const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

// --- Middleware ---
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// --- Routers + Route Mounting ---
const routes = require("./routes/routes");
app.use("/api/", routes);

app.get("/", (req, res) => {
  res.json({ message: "Welcome to the Find & Seek API!"});
});

// --- Error Handler ---
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: "Something went wrong!", error: err.message });
});

// --- Server Listener ---
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});