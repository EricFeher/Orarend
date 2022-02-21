//const db = require('../db/db');
const mysql = require('mysql2/promise');
class DAO{


//EGYÉB

	async getHetiOrak(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT tantargyak.nev,count(*) as db from tanarokorai,tantargyak, orarend where orarend.tantargy_id=tanarokorai.id and tanarokorai.tantargy_id=tantargyak.id group by tantargyak.nev');

		result.pop();
		console.log(result[0]);
		return result[0];
	}
	async getHetiTanarok(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT *,date_format(szulido, "%Y-%m-%d") as szulido1 from tanarok where id not in(SELECT DISTINCT tanarokorai.tanar_id from tanarokorai,orarend where orarend.tantargy_id=tanarokorai.id)');

		result.pop();
		console.log(result[0]);
		return result[0];
	}
	async getHetiErdekesseg(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT tantargyak.nev,sum(YEAR(CURRENT_DATE())-YEAR(tanarok.szulido)) as osszegeletkor,avg(YEAR(CURRENT_DATE())-YEAR(tanarok.szulido)) as atlageletkor,count(*) as tanardb from tantargyak,tanarok,tanarokorai where tanarokorai.tanar_id=tanarok.id and tanarokorai.tantargy_id=tantargyak.id GROUP by tantargyak.nev order by atlageletkor desc');

		result.pop();
		console.log(result[0]);
		return result[0];
	}

	async getTanuloOrarend(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute(
			"SELECT tanulok.keresztnev as tanulo_knev, tanulok.vezeteknev as tanulo_vnev,nap,kezdes,vege,tanarok.vezeteknev,tanarok.keresztnev,termek.szam as Teremszam,termek.nev as Teremnev, tantargyak.nev as Tantargy " +
			"FROM orarend,tanarok,termek,tantargyak,osztalyok,tanarokorai,tanulok " +
			"where orarend.osztaly_id=osztalyok.id and orarend.terem_id=termek.id and orarend.tantargy_id=tanarokorai.id" +
			" and tanarokorai.tanar_id=tanarok.id and tanarokorai.tantargy_id=tantargyak.id and osztalyok.id=tanulok.osztaly_id and tanulok.id=?",[id]);

		result.pop();
		console.log(result[0]);
		return result[0];
	}

	async getLetszamForDiagram(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('Select * from osztalyok');
		result.pop();
		console.log(result[0]);
		return result[0];
	}

//GET ONE

	async getTanar(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT id, vezeteknev, keresztnev, telefonszam, date_format(szulido, "%Y-%m-%d") as szulido1 FROM tanarok where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getTanulo(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT id, vezeteknev,osztaly_id, keresztnev, telefonszam, date_format(szulido, "%Y-%m-%d") as szulido1 FROM tanulok where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getTantargy(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM tantargyak where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getTerem(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM termek where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getOsztaly(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM osztalyok where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getOra(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT *,date_format(kezdes, "%H:%i:%s") as kezdes1,date_format(vege, "%H:%i:%s") as vege1 FROM orarend where id=?',[id]);
		result.pop();
		return result[0][0];
	}
	
	async getTanarOraja(id){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM tanarokorai where id=?',[id]);
		result.pop();
		return result[0][0];
	}


//GET EVERYTHING
	async getTanarok(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT *, date_format(szulido, "%Y-%m-%d") as szulido1 FROM tanarok');
		result.pop();
		return result[0];
	}
	
	async getTanulok(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT *, date_format(szulido, "%Y-%m-%d") as szulido1 FROM tanulok');
		result.pop();
		return result[0];
	}
	
	async getTantargyak(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM tantargyak');
		result.pop();
		return result[0];
	}
	
	async getTermek(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM termek');
		result.pop();
		return result[0];
	}
	
	async getOsztalyok(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM osztalyok');
		result.pop();
		return result[0];
	}
	
	async getOrak(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM orarend');
		result.pop();
		return result[0];
	}
	
	async getTanarokOrai(){
		let result;
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		result = await db.execute('SELECT * FROM tanarokOrai');
		result.pop();
		return result[0];
	}

//ADD

	async addTanar(vezeteknev, keresztnev,telefonszam,szulido){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO Tanarok (vezeteknev, keresztnev,telefonszam,szulido) VALUES (?,?,?,?)',[vezeteknev, keresztnev,telefonszam,szulido]);
	}

	async addTanulo(osztaly_id,vezeteknev, keresztnev,telefonszam,szulido){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO Tanulok (osztaly_id,vezeteknev, keresztnev,telefonszam,szulido) VALUES (?,?,?,?,?)',[osztaly_id,vezeteknev, keresztnev,telefonszam,szulido]);
		let resultO=await db.execute('SELECT letszam FROM osztalyok where id=?',[osztaly_id]);
		await db.execute('UPDATE osztalyok SET letszam=? where id=?',[resultO[0][0].letszam+1,osztaly_id]);
	}

	async addTantargy(nev){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO tantargyak (nev) VALUES (?)',[nev]);
	}

	async addTerem(epulet, szam, nev){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO termek (epulet, szam, nev) VALUES (?,?,?)',[epulet, szam, nev]);
	}

	async addOsztaly(evfolyam, jeloles, letszam,pic){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO osztalyok (evfolyam, jeloles, letszam, kep) VALUES (?,?,?,?)',[evfolyam, jeloles, letszam, pic]);
	}

	async addOra(osztaly_id, terem_id, tantargy_id, nap, kezdes, vege){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO orarend (osztaly_id, terem_id, tantargy_id, nap, kezdes, vege) VALUES (?,?,?,?,?,?)',[osztaly_id, terem_id, tantargy_id, nap, kezdes, vege]);
	}

	async addTanarOraja(tanar_id, tantargy_id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('INSERT INTO tanarokorai (tanar_id, tantargy_id) VALUES (?,?)',[tanar_id, tantargy_id]).catch(console.log);
	}


//UPDATE	
	
	async updateTanar(id, vezeteknev, keresztnev, telefonszam, szulido){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('UPDATE tanarok SET vezeteknev=?, keresztnev=?, telefonszam=?, szulido=? WHERE id=?',[vezeteknev,keresztnev,telefonszam,szulido,id]);
	}

	async updateTanulo(id, osztaly_id, vezeteknev, keresztnev, telefonszam, szulido){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		let resultT=await db.execute("SELECT * FROM tanulok where id=?",[id]);
		resultT.pop();
		console.log(resultT[0])
		console.log(resultT[0][0].osztaly_id)
		let resultO=await db.execute('SELECT letszam FROM osztalyok where id=?',[resultT[0][0].osztaly_id]);
		resultO.pop();
		await db.execute('UPDATE osztalyok SET letszam=? where id=?',[resultO[0][0].letszam-1,resultT[0][0].osztaly_id]);
		await db.execute('UPDATE tanulok SET osztaly_id=?, vezeteknev=?, keresztnev=?, telefonszam=?, szulido=? WHERE id=?',[osztaly_id,vezeteknev,keresztnev,telefonszam,szulido,id]);
		resultO=await db.execute('SELECT letszam FROM osztalyok where id=?',[osztaly_id]);
		await db.execute('UPDATE osztalyok SET letszam=? where id=?',[resultO[0][0].letszam+1,osztaly_id]);
	}

	async updateTantargy(id, nev) {
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('UPDATE tantargyak SET nev=? WHERE id=?', [nev, id]);
	}

	async updateTerem(id, epulet, szam, nev) {
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('UPDATE termek SET epulet=?, szam=?, nev=? WHERE id=?', [epulet, szam, nev, id]);
	}

	async updateOsztaly(id, evfolyam, jeloles, letszam, kep) {
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('UPDATE osztalyok SET evfolyam=?, jeloles=?, letszam=?, kep=? WHERE id=?', [evfolyam, jeloles, letszam, kep, id]);
	}

	async updateOra(id, osztaly_id, terem_id, tantargy_id, nap, kezdes, vege) {
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		let date='1970-01-01';
		console.log(date+" "+kezdes);
		await db.execute('UPDATE orarend SET osztaly_id=?, terem_id=?, tantargy_id=?, nap=?, kezdes=?, vege=? WHERE id=?', [osztaly_id, terem_id, tantargy_id, nap, date+" "+kezdes, date+" "+vege, id]);
	}

	async updateTanarOraja(id, tanar_id, tantargy_id) {
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('UPDATE tanarokorai SET tanar_id=?, tantargy_id=? WHERE id=?', [tanar_id,tantargy_id, id]);
	}


//DELETE 

	async deleteTanar(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM tanarok where id=?',[id]);
	}
	
	async deleteTanulo(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});

		let resultT=await db.execute('SELECT osztaly_id FROM tanulok where id=?',[id]);
		let resultO=await db.execute('SELECT letszam FROM osztalyok where id=?',[resultT[0][0].osztaly_id]);
		await db.execute('UPDATE osztalyok SET letszam=? where id=?',[resultO[0][0].letszam-1,resultT[0][0].osztaly_id]);
		await db.execute('DELETE FROM tanulok where id=?',[id]);


	}
	
	async deleteTantargy(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM tantargyak where id=?',[id]);
	}
	
	async deleteTerem(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM termek where id=?',[id]);
	}
	
	async deleteOsztaly(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM osztalyok where id=?',[id]);
	}
	
	async deleteOra(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM orarend where id=?',[id]);
	}
	
	async deleteTanarOraja(id){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		await db.execute('DELETE FROM tanarokorai where id=?',[id]);
	}

//OTHER
	async getHighestIDOfOsztalyok(){
		const db = await mysql.createConnection({
			host: 'localhost',
			user: 'root',
			password: '',
			database: 'orarend'
		});
		let result = await db.execute('SELECT max(id) as maxid FROM osztalyok');
		result.pop();
		return result[0][0];
	}

	
} module.exports=DAO;
/*db.query('SELECT * FROM aru', (err,result) =>{
        if (err) throw err;
        return res.render("aru", {
            aruk : result,
        });
    });*/