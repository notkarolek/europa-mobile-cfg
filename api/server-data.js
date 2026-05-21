const https = require('https');
const API_URL = 'https://samp-api.ct8.pl/server/194.147.32.5';
function fetchServerInfo() {
 return new Promise((resolve, reject) => {
  https.get(API_URL, (response) => {
   let data = '';
   response.on('data', (chunk) => {
    data += chunk;
   });
   response.on('end', () => {
    try {
     const jsonData = JSON.parse(data);
     const result = {
      query: [{
       number: 9,
       name: jsonData.hostname,
       ip: jsonData.ip,
       port: parseInt(jsonData.port, 10),
       online: jsonData.players,
       maxplayers: jsonData.maxplayers,
       password: jsonData.password
      }]
     };
     resolve(result);
    } catch (error) {
     reject(new Error('Failed to parse JSON: ' + error.message));
    }
   });
  }).on('error', (error) => {
   reject(new Error('Request failed: ' + error.message));
  });
 });
}
module.exports = async function handler(req, res) {
 try {
  const data = await fetchServerInfo();
  res.status(200).json(data);
 } catch (error) {
  res.status(500).json({ error: error.message });
 }
};