const Pool = require("pg").Pool;
require("dotenv").config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.HOST,
  database: process.env.DATABASE,
  password: process.env.PASSWORD,
  port: process.env.PORT,
});

const getCategoriies = () => {
  console.log(process.env.HOST);
  return new Promise(function (resolve, reject) {
    const query = "select distinct(category) from flash_cards;";
    pool.query(query, (error, results) => {
      if (error) {
        reject(error);
      }
      resolve(results.rows);
    });
  });
};

const getCategory = (category) => {
  return new Promise(function (resolve, reject) {
    const query =
      "select id, term, description from flash_cards where category = $1";
    pool.query(query, [category], (error, results) => {
      if (error) {
        reject(error);
      }
      resolve(results.rows);
    });
  });
};

module.exports = {
  getCategoriies,
  getCategory,
};
