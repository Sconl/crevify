const admin = require('firebase-admin');

// Replace with the path to your service account key file
const serviceAccount = require('C:/Users/ACE DESIGN STUDIO/OneDrive - acexoft/_Sconl/Projects/Development/crevify/Resources/service_account_key/crevify-app-firebase-adminsdk-97y9v-89397b491e.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'crevify-app.appspot.com' // replace with your actual bucket name
});

const bucket = admin.storage().bucket();

async function generateDownloadUrls() {
  const [files] = await bucket.getFiles({ prefix: 'placeholder_food_images' });
  
  for (const file of files) {
    const config = {
      action: 'read',
      expires: '03-01-2500', // Set this to a date far in the future
    };

    const url = await file.getSignedUrl(config);
    
    // Here you can save the URL to Firestore
    console.log(url);
  }
}

generateDownloadUrls();
