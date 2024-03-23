// Import the express and axios libraries
const express = require('express');
const axios = require('axios');

// Create an instance of express
const app = express();

// Specify a port for our server
const port = process.env.PORT || 3000;

// Define a route for making M-PESA transactions
app.post('/mpesa', async (req, res) => {
  try {
    // Make a POST request to the M-PESA Daraja API
    const mpesaResponse = await axios.post('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest', {
      // Your M-PESA Daraja API parameters go here
    });

    // Send the response from the M-PESA Daraja API back to your Flutter app
    res.send(mpesaResponse.data);
  } catch (error) {
    // Handle any errors that occur during the request
    console.error(error);
    res.status(500).send('An error occurred while processing the M-PESA transaction.');
  }
});

// Define a route
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
