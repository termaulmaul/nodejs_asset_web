const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const db = require('./src/database'); // Assuming database.js is in src

const app = express();
const PORT = 3000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public'))); // Serve static files from 'public' folder
app.use('/assets', express.static(path.join(__dirname, 'assets'))); // Serve assets from 'assets' folder

app.use(bodyParser.urlencoded({ extended: true }));

// Halaman login
app.get('/login', (req, res) => {
    res.render('login');
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    db.query('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.redirect('/assets');
        } else {
            res.send('Invalid credentials.');
        }
    });
});

// Halaman utama aset
app.get('/assets', (req, res) => {
    db.query('SELECT * FROM assets', (err, results) => {
        if (err) throw err;
        res.render('index', { assets: results });
    });
});

// Menambah aset
app.get('/add-asset', (req, res) => {
    res.render('add-asset');
});

app.post('/add-asset', (req, res) => {
    const { asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition } = req.body;
    db.query('INSERT INTO assets (asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition], (err) => {
        if (err) throw err;
        res.redirect('/assets');
    });
});

// Mengedit aset
app.get('/edit-asset/:id', (req, res) => {
    const assetId = req.params.id;
    db.query('SELECT * FROM assets WHERE id = ?', [assetId], (err, results) => {
        if (err) throw err;
        res.render('edit-asset', { asset: results[0] });
    });
});

app.post('/edit-asset/:id', (req, res) => {
    const assetId = req.params.id;
    const { asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition } = req.body;
    db.query('UPDATE assets SET asset_class = ?, asset_number = ?, investment_order = ?, asset_name = ?, serial_number = ?, merk, type = ?, branch_code = ?, branch_name = ?, division_name = ?, department_name = ?, user_name = ?, acquisition_price = ?, acquisition_year = ?, amortization_percentage = ?, condition = ? WHERE id = ?', [asset_class, asset_number, investment_order, asset_name, serial_number, merk, type, branch_code, branch_name, division_name, department_name, user_name, acquisition_price, acquisition_year, amortization_percentage, condition, assetId], (err) => {
        if (err) throw err;
        res.redirect('/assets');
    });
});

// Menghapus aset
app.post('/delete-asset/:id', (req, res) => {
    const assetId = req.params.id;
    db.query('DELETE FROM assets WHERE id = ?', [assetId], (err) => {
        if (err) throw err;
        res.redirect('/assets');
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
