const express = require('express');
const app = express();
app.use(express.json());

app.post('/addexpense', (req, res) => {
  console.log('Received:', req.body);
  res.status(200).send('Expense added!');
});

app.listen(3000, () => {
  console.log('Server running on http://localhost:3000');
});
