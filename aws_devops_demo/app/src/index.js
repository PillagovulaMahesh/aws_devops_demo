// app/src/index.js
const express = require('express');
const app = express();

// Default port (ECS will inject PORT as env var)
const port = process.env.PORT || 3000;

// Simple health check endpoint (for ECS/ALB)
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', service: 'aws-devops-demo' });
});

// Root endpoint
app.get('/', (req, res) => {
  res.send('🚀 Hello from AWS DevOps Demo App!');
});

// Start server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
