const { MongoClient } = require('mongodb');
const { v4: uuidv4 } = require('uuid');

// Connection URL and Database Name
const url = process.env.MONGODB_URL;
const dbName = process.env.DB_NAME;

let client;

async function connect() {
  if (!client) {
    client = await MongoClient.connect(url, { useUnifiedTopology: true });
  }
  return client.db(dbName);
}

module.exports = async (req, res) => {
  try {
    if (req.method === 'POST') {
      const db = await connect();
      const collection = db.collection('users');

      // Generate a new unique ID
      const id = uuidv4();

      // Increment the user count
      const userCount = await collection.countDocuments() + 1;

      // Store the user data in the database
      await collection.insertOne({ id, userCount });

      // Return the user number
      res.status(200).json({ userNumber: userCount });
    } else {
      res.status(405).json({ error: 'Only POST requests are allowed' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred while processing your request' });
  }
};
