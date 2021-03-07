%dw 2.0
var empData = {
	"employee": [{
		"id": "A007",
		"first_name": "Jan",
		"last_name": "Doe"
	},{
		"id": "A008",
		"first_name": "Ron",
		"last_name": "David"
	},{
		"id": "A009",
		"first_name": "Jane",
		"last_name": "Kane"
	},{
		"id": "A010",
		"first_name": "Marsh",
		"last_name": "Megan"
	},{
		"id": "A011",
		"first_name": "Kelly",
		"last_name": "Mitch"
	},{
		"id": "A012",
		"first_name": "Chris",
		"last_name": "Vaste"
	}]
}
var scbData = {
	"scoreBoard": [{
		"id": "A007",
		"subjects": ["Maths","English","Arts","Drawimgs"],
		"score": [80,75,89,100]
	},{
		"id": "A008",
		"subjects": ["Maths","English","Arts","Drawimgs"],
		"score": [70,85,69,90]
	},{
		"id": "A021",
		"subjects": ["Maths","English","Arts","Drawimgs"],
		"score": [90,87,77,95]
	}]
}
fun getIdData(Id) = scbData.scoreBoard filter ($.id == Id)
output application/json
---
{
	certificate: empData.employee map ((item, index) -> {
		id: item.id,
		firstName: item.first_name,
		LastName: item.last_name,
		MarksBySubjectWise: (getIdData(item.id)[0].subjects default [] map ((item01, index01) -> {
			(item01) : getIdData(item.id)[0].score[index01]
		})) reduce ((item, accumulator) -> accumulator ++ item)
	})
}