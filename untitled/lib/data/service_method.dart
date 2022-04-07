String data = """{
	"data": {
		"slides": [{
				"image": "https://note.youdao.com/yws/api/personal/file/WEB2e3fbee2bf0f2cdc5b9af0548195219e?method=download&shareKey=3e748f6c7cbb628ca0203a0d38944619"
			},
			{
				"image": "https://note.youdao.com/yws/api/personal/file/WEB2e3fbee2bf0f2cdc5b9af0548195219e?method=download&shareKey=3e748f6c7cbb628ca0203a0d38944619"
			},
			{
				"image": "https://note.youdao.com/yws/api/personal/file/WEB2e3fbee2bf0f2cdc5b9af0548195219e?method=download&shareKey=3e748f6c7cbb628ca0203a0d38944619"
			}
		],
		 "type": [
	   {
	      "name":"类别1",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "name":"类别2",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "name":"类别3",
	       "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		  {
	      "name":"类别4",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "name":"类别5",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "name":"类别6",
	       "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 }
		 ],
		  "recommend": [
	   {
	      "price":"100",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "price":"120",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "price":"500",
	       "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		  {
	      "price":"700",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "price":"360",
	      "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 },
		 {
	       "price":"120",
	       "image":"https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe"
		 }
		 ]
	}
}""";

Future getHomePageData() async {
  String result;
  result = await data;
  return result;
}
