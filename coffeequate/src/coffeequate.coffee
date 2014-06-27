### Coffeequate - http://github.com/MatthewJA/Coffeequate ###

require.config
		baseUrl: "./"

define ["operators", "Expression", "parse"], (operators, Expression, parse) ->

	# Converts string inputs into Expressions, which Coffeequate can then work with.
	# (Public interface for Coffeequate - this is all that the user will see!)
	#
	# @param input [String] A string to be parsed.
	# @return [Expression] A Coffeequate Expression which the string represented.
	#
	# @example A simple expression.
	# 	CQ("a + 2*b")
	#
	# @example An equation.
	# 	CQ("a**2 + b**2 = c**2")
	CQ = (input) ->
	if /\=/.test(input)
		# This is an equation.
		[left, right] = input.split("=")
		val = new operators.Add(parse.stringToExpression(right),
				new operators.Mul(parse.stringToExpression(left), "-1"))
		return new Expression(val)
	else
		# This is an expression.
		return new Expression(input)

	return CQ