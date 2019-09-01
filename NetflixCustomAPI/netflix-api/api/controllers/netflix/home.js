module.exports = async function(req, res) {

	const netflix = await Netflix.find()

	res.send(netflix)
}