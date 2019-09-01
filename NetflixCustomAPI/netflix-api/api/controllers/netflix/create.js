module.exports = async function(req, res) {

	const movieNameBody = req.body.movieNameBody

	const netflix = await Netflix.create({movieName: movieNameBody}).fetch()

	res.send(netflix)
}