module.exports = async function(req, res) {


	const userId = req.session.userId;

	console.log(userId)

	const netflix = await Netflix.find({user: userId}).populate('user')

	// console.log(req.body)
	// return res.send(netflix)

	if (req.wantsJSON) {
		res.send(netflix)
	} else {
		res.view('pages/netflix/home', {netflix})
	}
	// return res.send(netflix)

}