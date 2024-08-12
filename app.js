const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const session = require('express-session');
const db = require('./src/database'); // Assuming database.js is in src

const app = express();
const PORT = 3000;

// Middleware setup
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public'))); // Serve static files from 'public' folder
app.use('/assets', express.static(path.join(__dirname, 'assets'))); // Serve assets from 'assets' folder

// Set up session middleware
app.use(session({
    secret: 'your-secret-key', // Change this to a secure key in production
    resave: false,
    saveUninitialized: true
}));

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Authentication middleware
function ensureAuthenticated(req, res, next) {
    if (req.session.loggedIn) {
        return next();
    }
    res.redirect('/login');
}

// Redirect root URL to login
app.get('/', (req, res) => {
    res.redirect('/login');
});

// Halaman login
app.get('/login', (req, res) => {
    res.render('login');
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    db.query('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        if (results.length > 0) {
            req.session.loggedIn = true; // Set session to indicate user is logged in
            res.redirect('/assets');
        } else {
            res.send('Invalid credentials.');
        }
    });
});

// Halaman utama aset
app.get('/assets', ensureAuthenticated, (req, res) => {
    const searchQuery = req.query.search || '';
    const query = 'SELECT * FROM assets WHERE asset_name LIKE ?';
    db.query(query, [`%${searchQuery}%`], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        res.render('index', { assets: results, searchQuery: searchQuery });
    });
});

// Menambah aset
app.get('/add-asset', ensureAuthenticated, (req, res) => {
    res.render('add-asset');
});

app.post('/add-asset', ensureAuthenticated, (req, res) => {
    const { 
        asset_class, asset_number, investment_order, asset_name, serial_number, 
        merk, type, branch_code, branch_name, division_name, 
        department_name, user_name, acquisition_price, acquisition_year, 
        amortization_percentage, condition 
    } = req.body;

    const sql = `
        INSERT INTO assets (
            asset_class, asset_number, investment_order, asset_name, 
            serial_number, merk, type, branch_code, branch_name, 
            division_name, department_name, user_name, acquisition_price, 
            acquisition_year, amortization_percentage, \`condition\`
        ) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const values = [
        asset_class, asset_number, investment_order, asset_name, 
        serial_number, merk, type, branch_code, branch_name, 
        division_name, department_name, user_name, acquisition_price, 
        acquisition_year, amortization_percentage, condition
    ];

    db.query(sql, values, (err) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        res.redirect('/assets');
    });
});

// Mengedit aset
app.get('/edit-asset/:id', ensureAuthenticated, (req, res) => {
    const assetId = req.params.id;
    db.query('SELECT * FROM assets WHERE id = ?', [assetId], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        res.render('edit-asset', { asset: results[0] });
    });
});

app.post('/edit-asset/:id', ensureAuthenticated, (req, res) => {
    const { id } = req.params;
    const { asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition } = req.body;
    
    const query = `
        UPDATE assets 
        SET asset_class = ?, 
            asset_number = ?, 
            investment_order = ?, 
            asset_name = ?, 
            serial_number = ?, 
            merk = ?, 
            type = ?, 
            branch_code = ?, 
            branch_name = ?, 
            division_name = ?, 
            department_name = ?, 
            user_name = ?, 
            acquisition_price = ?, 
            acquisition_year = ?, 
            amortization_percentage = ?, 
            \`condition\` = ? 
        WHERE id = ?
    `;
    
    db.query(query, [asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition, id], (err) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        res.redirect('/assets');
    });
});


// Menghapus aset
app.post('/delete-asset/:id', ensureAuthenticated, (req, res) => {
    const assetId = req.params.id;
    db.query('DELETE FROM assets WHERE id = ?', [assetId], (err) => {
        if (err) {
            console.error('Database query error:', err);
            return res.send('An error occurred.');
        }
        res.redirect('/assets');
    });
});

// Rute untuk halaman profil
app.get('/profile', (req, res) => {
    const user = req.session.user; // Pastikan data user ada dalam session
    if (!user) {
        return res.redirect('/login'); // Redirect ke halaman login jika belum login
    }
    res.render('/profile', { user: user });
});

// Logout
app.get('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            console.error('Session destroy error:', err);
            return res.send('An error occurred.');
        }
        res.redirect('/login');
    });
});


app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
