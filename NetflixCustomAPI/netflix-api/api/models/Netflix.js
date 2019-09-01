module.exports = {
	attributes: {
		movieName: {
		type: 'string', 
		required: true
		},

		user: {
            model: 'user'
        },

        isMovie: {
        	type: 'boolean'
        }
	}
}