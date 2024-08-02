const express = require('express');
const path = require('path');
const app = express();

// Middleware to serve static files
app.use(express.static(path.join(__dirname, 'public')));

// Set EJS as the templating engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Route for login page
app.get('/login', (req, res) => {
    res.render('login');
});

app.post('/login', (req, res) => {
    // Handle login logic here
    res.redirect('/');
});

app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
