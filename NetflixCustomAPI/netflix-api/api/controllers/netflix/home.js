module.exports = async function(req, res) {


	const userId = req.session.userId;

	console.log(userId)

	const netflix = await Netflix.find({user: userId}).populate('user')

	// return res.send(netflix)
	res.view('pages/netflix/home', {netflix})

}