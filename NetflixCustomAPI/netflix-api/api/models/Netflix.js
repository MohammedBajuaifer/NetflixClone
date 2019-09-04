module.exports = {
	attributes: {
		movieName: {
			type: 'string', 
			required: true
		},
		imageUrl: {
			type: 'string'
		},
		user: {
            model: 'user'
        },

        isMovie: {
        	type: 'boolean',
        	defaultsTo: true
        }
	}
}