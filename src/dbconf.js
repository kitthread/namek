const oracledb = require('oracledb');

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

const mypw = "msuser1234" 

async function run() {

  let connection;

  try {
    connection = await oracledb.getConnection( {
      user          : "msuser",
      password      : mypw,
      connectString : "localhost/medistar"
    });

    const result = await connection.execute(
      `select value
      from flags_and_settings_global
      where key_name='MS_DDL_UPDATED'`
    );
    console.log(result.rows);

  } catch (err) {
    console.error(err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error(err);
      }
    }
  }
}

run();