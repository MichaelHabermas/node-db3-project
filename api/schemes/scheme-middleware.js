const Schemes = require('./scheme-model.js');

const checkSchemeId = (req, res, next) => {
	const { scheme_id } = req.params;
	Schemes.findById(scheme_id)
		.then(scheme => {
			if (!scheme) {
				next({ status: 404, message: `scheme with scheme_id ${scheme_id} not found` });
			} else {
				next();
			}
		})
		.catch(next);
};

const validateScheme = (req, res, next) => {
	const { scheme_name } = req.body;
	/* If `scheme_name` is missing, empty string or not a string:*/
	if (!scheme_name || scheme_name === undefined || typeof scheme_name !== 'string') {
		next({ status: 400, message: 'invalid scheme_name' });
	} else {
		next();
	}
};

const validateStep = (req, res, next) => {
	const { instructions, step_number } = req.body;
	/* If `instructions` is missing, empty string or not a string, or
    if `step_number` is not a number or is smaller than one: */
	if (!!instructions || typeof instructions !== 'string' || isNaN(step_number) || step_number < 1) {
		next({ status: 400, message: 'invalid step' });
	} else {
		next();
	}
};

module.exports = {
	checkSchemeId,
	validateScheme,
	validateStep
};
