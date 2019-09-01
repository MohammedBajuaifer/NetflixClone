module.exports = async function(req, res) {

	const movieNameBody = req.body.movieNameBody
	const isMovie = req.body.isMovie
	const userId = req.session.userId
	const netflix = await Netflix.create({movieName: movieNameBody, user: userId, isMovie: false}).fetch()

	res.redirect('/home')
}