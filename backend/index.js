const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

// Placeholder root endpoint
app.get('/', (req, res) => {
  res.send('Venue Relationship Tracker API running.');
});

// TODO: Add booking, user, venue, and message endpoints.

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`API server listening on port ${PORT}`);
});
