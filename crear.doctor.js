const { pool } = require('../config/db.config');
const { encriptar } = require('../services/encrypt.pass');
const { uploadFotosDoctor, uploadCarneDoctor } = require('../services/upload.fotos');

async function crearDoctor(objPaciente, files) {
    let dataSave = objPaciente;
    const emailUser = dataSave.email;
    const encryptPass = await encriptar(dataSave.pass);
    console.log(`Se encripto la contraseña de: ${emailUser}`);
    const rutaPerfil = await uploadFotosDoctor(files);
    const rutaCar = await uploadCarneDoctor(files);
    dataSave.pass = encryptPass;
    dataSave.rutaImg = rutaPerfil;
    dataSave.rutaCarne = rutaCar;
    const userLog = {
        estado: '0',
        email: dataSave.email,
        pass: dataSave.pass,
        rol: 'salud'
    }
    console.table(dataSave);
    console.table(userLog);
    await pool.query('INSERT INTO doctores SET ?', [dataSave]);
    await pool.query('INSERT INTO usuarios SET ?', [userLog]);
    console.log('Se creo el usuario correctamente');
}

module.exports = {
    crearDoc: crearDoctor
}