module.exports = async function(req, res) {

	const movieNameBody = req.body.movieNameBody

	const isMovie = req.body.isMovie

	const userId = req.session.userId

	const file = req.file("imagefile")

	const options =
      { // This is the usual stuff
        adapter: require('skipper-better-s3')
      , key: 'AKIAJFHAVSMP4R5P3IOQ'
      , secret: '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'
      , bucket: 'netfliximagesbucket'
      , region: 'us-east-1'  // Optional - default is 'us-standard'
        // Let's use the custom s3params to upload this file as publicly
        // readable by anyone
      , s3params:
        { ACL: 'public-read'
        }
        // And while we are at it, let's monitor the progress of this upload
      , onProgress: progress => sails.log.verbose('Upload progress:', progress)
      }
 
	file.upload(options, async (err, files) => {
	  // ... Continue as usual
    	const fileUrl = files[0].extra.Location
 	
 		console.log(files)
	  	const netflix = await Netflix.create({movieName: movieNameBody, user: userId, imageUrl: fileUrl}).fetch()
	  	console.log(netflix)
	  	res.redirect('/home')


	})
}