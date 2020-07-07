const { pool } = require('../config/db.config');
const { encriptar } = require('../services/encrypt.pass');
const { uploadFotosPaciente } = require('../services/upload.fotos');

async function crearPaciente(objPaciente, files) {
    let dataSave = objPaciente;
    const emailUser = dataSave.email;
    const encryptPass = await encriptar(dataSave.pass);
    console.log(`Se encripto la contraseña de: ${emailUser}`);
    const rutaPerfil = await uploadFotosPaciente(files);
    dataSave.pass = encryptPass;
    dataSave.rutaImg = rutaPerfil;
    const userLog = {
        estado: '0',
        email: dataSave.email,
        pass: dataSave.pass,
        rol: 'paciente'
    }
    console.table(dataSave);
    console.table(userLog);
    await pool.query('INSERT INTO pacientes SET ?', [dataSave]);
    await pool.query('INSERT INTO usuarios SET ?', [userLog]);
    console.log('Se creo el usuario correctamente');
}

module.exports = {
    crearPac: crearPaciente
}