const quries = {
  signup: `INSERT INTO USER (id, password) VALUES (?, ?)`,
  findUserBYId: `SELECT * FROM USER WHERE id = ?`,
};

export default quries;
