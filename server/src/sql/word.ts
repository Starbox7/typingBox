const queries = {
  insert: `INSERT INTO WORD (word) VALUES (?);`,
  select: `SELECT*FROM WORD ORDER BY RAND() LIMIT 1;`,
  init: `SELECT * FROM WORD ORDER BY RAND() LIMIT 2;`,
};

export default queries;
