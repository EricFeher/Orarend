const express = require('express');
const router = express.Router();
const  db  = require("../db/db");
const dao = require("../dao/DAO");

//NAVIGATION

router.get("/", (req,res) =>{
	res.render("index");
});

router.get("/heti", async (req,res) =>{
	let orak=await new dao().getHetiOrak();
	let tanarok=await new dao().getHetiTanarok();
	let erdekessegek=await new dao().getHetiErdekesseg();
	res.render("heti",{
		orak:orak,
		tanarok:tanarok,
		erdekessegek:erdekessegek
	});
});

router.get("/diagram", async (req,res) =>{
	let results=await new dao().getLetszamForDiagram();
	res.render("diagram",{
		results:results
	});
});


router.get("/orarend", async (req,res) =>{
	let tanarok=await new dao().getTanarok();
	let tanulok=await new dao().getTanulok();
	let tantargyak=await new dao().getTantargyak();
	let termek=await new dao().getTermek();
	let osztalyok=await new dao().getOsztalyok();
	let orak=await new dao().getOrak();
	let tanarokOrai=await new dao().getTanarokOrai();

	tanulokID=[];

	for(const tanulo of tanulok){
		tanulokID.push(tanulo.id);
	}
	res.render("orarend",{
		tanarok:tanarok,
		tanulok:tanulok,
		tantargyak:tantargyak,
		termek:termek,
		osztalyok:osztalyok,
		orak:orak,
		tanarokOrai:tanarokOrai,
		tanulokID:tanulokID
	});
});
router.post("/orarend", async (req,res) => {
	let tanarok=await new dao().getTanarok();
	let tanulok=await new dao().getTanulok();
	let tantargyak=await new dao().getTantargyak();
	let termek=await new dao().getTermek();
	let osztalyok=await new dao().getOsztalyok();
	let orak=await new dao().getOrak();
	let tanarokOrai=await new dao().getTanarokOrai();
	let orarend=await new dao().getTanuloOrarend(req.body.id);
	tanulokID=[];
	for(const tanulo of tanulok){
		tanulokID.push(tanulo.id);
	}
	res.render("orarend",{
		tanarok:tanarok,
		tanulok:tanulok,
		tantargyak:tantargyak,
		termek:termek,
		osztalyok:osztalyok,
		orak:orak,
		tanarokOrai:tanarokOrai,
		tanulokID:tanulokID,
		orarend:orarend
	});
});
router.get("/admin", async (req,res) =>{
	
	let tanarok=await new dao().getTanarok();
	let tanulok=await new dao().getTanulok();
	let tantargyak=await new dao().getTantargyak();
	let termek=await new dao().getTermek();
	let osztalyok=await new dao().getOsztalyok();
	let orak=await new dao().getOrak();
	let tanarokOrai=await new dao().getTanarokOrai();
	res.render("admin",{
		tanarok:tanarok,
		tanulok:tanulok,
		tantargyak:tantargyak,
		termek:termek,
		osztalyok:osztalyok,
		orak:orak,
		tanarokOrai:tanarokOrai
	});
});

//UPDATE FUNCTIONS

router.get("/edittanar/:id", async (req,res)=>{
	let result=await new dao().getTanar(req.params.id);
	res.render('edittanar',{
		result:result
	});
});

router.post("/edittanar", async (req,res)=>{
	await new dao().updateTanar(req.body.id,req.body.vezeteknev,req.body.keresztnev,req.body.telefonszam,req.body.szulido);
	res.redirect('/admin');
});

router.get("/edittanulo/:id", async (req,res)=>{
	let result=await new dao().getTanulo(req.params.id);
	console.log(result);
	res.render('edittanulo',{
		result:result
	});
});

router.post("/edittanulo", async (req,res)=>{
	await new dao().updateTanulo(req.body.id,req.body.osztaly_id,req.body.vezeteknev,req.body.keresztnev,req.body.telefonszam,req.body.szulido);
	res.redirect('/admin');
});

router.get("/edittantargy/:id", async (req,res)=>{
	let result=await new dao().getTantargy(req.params.id);
	res.render('edittantargy',{
		result:result
	});
});

router.post("/edittantargy", async (req,res)=>{
	await new dao().updateTantargy(req.body.id,req.body.nev);
	res.redirect('/admin');
});

router.get("/editterem/:id", async (req,res)=>{
	let result=await new dao().getTerem(req.params.id);
	res.render('editterem',{
		result:result
	});
});

router.post("/editterem", async (req,res)=>{
	await new dao().updateTerem(req.body.id,req.body.epulet,req.body.szam,req.body.nev);
	res.redirect('/admin');
});

router.post("/editosztaly", async (req,res)=>{
	let filename;
	if(req.files!==null){
		let path="./public/Kepek";
		let file=req.files.pic;
		let extension="."+file.name.split(".")[file.name.split(".").length-1];
		let highestValue=await new dao().getHighestIDOfOsztalyok();
		filename=req.body.id+extension;
		file.name=filename;
		file.mv(path+"/"+file.name,(err)=>{
			if(err){
				console.log(err);
			}
			else{
				console.log("Feltöltve: "+file.name);
			}
		});
	}
	else{
		let osztaly=await new dao().getOsztaly(req.body.id);
		filename=osztaly.kep;
	}
	await new dao().updateOsztaly(req.body.id,req.body.evfolyam,req.body.jeloles,req.body.letszam,filename);
	res.redirect('/admin');
});

router.get("/editosztaly/:id", async (req,res)=>{
	let result=await new dao().getOsztaly(req.params.id);
	res.render('editosztaly',{
		result:result
	});
});

router.post("/editora", async (req,res)=>{
	await new dao().updateOra(req.body.id,req.body.osztaly_id,req.body.terem_id,req.body.tantargy_id,req.body.nap,req.body.kezdes,req.body.vege);
	res.redirect('/admin');
});

router.get("/editora/:id", async (req,res)=>{
	let result=await new dao().getOra(req.params.id);
	res.render('editora',{
		result:result
	});
});

router.post("/edittanaroraja", async (req,res)=>{
	await new dao().updateTanarOraja(req.body.id,req.body.tanar_id,req.body.tantargy_id);
	res.redirect('/admin');
});

router.get("/edittanaroraja/:id", async (req,res)=>{
	let result=await new dao().getTanarOraja(req.params.id);
	res.render('edittanaroraja',{
		result:result
	});
});


//ADD FUNCTIONS

router.post("/addTanar", async(req,res)=>{
	await new dao().addTanar(req.body.vezeteknev, req.body.keresztnev,req.body.telefonszam,req.body.szulido);
	res.redirect("/admin");
});

router.post("/addTanulo", async(req,res)=>{
	await new dao().addTanulo(req.body.osztaly,req.body.vezeteknev, req.body.keresztnev,req.body.telefonszam,req.body.szulido);
	res.redirect("/admin");
});

router.post("/addTantargy", async(req,res)=>{
	await new dao().addTantargy(req.body.nev);
	res.redirect("/admin");
});

router.post("/addTerem", async(req,res)=>{
	await new dao().addTerem(req.body.epulet, req.body.szam, req.body.nev);
	res.redirect("/admin");
});

router.post("/addOsztaly", async(req,res)=>{
	let path="./public/Kepek";
	let file=req.files.pic;
	let extension="."+file.name.split(".")[file.name.split(".").length-1];
	let highestValue=await new dao().getHighestIDOfOsztalyok();
	let filename=(isNaN(parseInt(highestValue.maxid+"")) ? 1 : parseInt(highestValue.maxid+"")+1)+extension;
	file.name=filename;
	file.mv(path+"/"+file.name,(err)=>{
		if(err){
			console.log(err);
		}
		else{
			console.log("Feltöltve: "+file.name);
		}
	});
	await new dao().addOsztaly(req.body.evfolyam, req.body.jeloles, req.body.letszam, file.name);
	res.redirect("/admin");
});

router.post("/addOra", async(req,res)=>{
	await new dao().addOra(req.body.osztaly_id, req.body.terem_id, req.body.tantargy_id, req.body.nap, req.body.kezdes, req.body.vege);
	res.redirect("/admin");
});

router.post("/addTanarOraja", async(req,res)=>{
	await new dao().addTanarOraja(req.body.tanar_id, req.body.tantargy_id);
	res.redirect("/admin");
});


//DELETE FUNCTIONS

router.post("/deletetanar/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteTanar(req.params.id);
	res.redirect('/admin');
});

router.post("/deletetanulo/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteTanulo(req.params.id);
	res.redirect('/admin');
});

router.post("/deletetantargy/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteTantargy(req.params.id);
	res.redirect('/admin');
});

router.post("/deleteosztaly/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteOsztaly(req.params.id);
	res.redirect('/admin');
});

router.post("/deleteora/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteOra(req.params.id);
	res.redirect('/admin');
});

router.post("/deletetanaroraja/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteTanarOraja(req.params.id);
	res.redirect('/admin');
});

router.post("/deleteterem/:id", async (req,res) =>{
	console.log(req.params.id);
	await new dao().deleteTerem(req.params.id);
	res.redirect('/admin');
});


module.exports = router;