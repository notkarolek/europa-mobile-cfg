export default async function handler(req, res) {
  const jsonData = {"query":[]};
  res.setHeader('Content-Type', 'application/json');
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.status(200).send(JSON.stringify(jsonData));
}