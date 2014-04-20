package com.andreallen
{
	import libs.txt;
	
	public class TextFieldAb extends txt
	{
		private var _abbXml:XML
		private var _vo:ApiVO
		private var _voArr:Array
//RECIEVES THE XML DATA				
		public function TextFieldAb(aX:XML)
		{
			super();
			_voArr=[]
			_abbXml=aX
//PUTS THE DATA INTO VO'S 				
			for(var i:int=0;i<_abbXml.result.length();i++)
			{
				_vo= new ApiVO
				_vo.term=_abbXml.result[i].term.text();
				_vo.def=_abbXml.result[i].definition.text();
				_vo.cate=_abbXml.result[i].category.text();
				_voArr.push(_vo);
			}
		 passer()
		
		}
		private function passer():void
		{
			this.tfAterm.text = "" +_voArr[0].term;
			this.tfAterm2.text= "" + _voArr[1].term;
			this.tfAterm3.text= "" + _voArr[2].term;
			this.tfAterm4.text= "" + _voArr[3].term;
			this.tfAterm5.text= "" + _voArr[4].term;
				
			this.tfAdef.text= "" + _voArr[0].def;	
			this.tfAdef2.text="" + _voArr[1].def;
			this.tfAdef3.text="" + _voArr[2].def;
			this.tfAdef4.text="" + _voArr[3].def;
			this.tfAdef5.text="" + _voArr[4].def;
			
			this.tfAcat.text=""  + _voArr[0].cate;
			this.tfAcat2.text="" + _voArr[1].cate;
			this.tfAcat3.text="" + _voArr[2].cate; 
			this.tfAcat4.text="" + _voArr[3].cate;
			this.tfAcat5.text="" + _voArr[4].cate;
		}
	}
}