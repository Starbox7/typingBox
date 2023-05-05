const queries = {
  insert: `INSERT INTO SHORT (name, short) VALUES (?, ?);`,
  select: `SELECT * FROM SHORT ORDER BY RAND() LIMIT 1;`,
  init: `SELECT * FROM SHORT ORDER BY RAND() LIMIT 2;`,
};

export default queries;
