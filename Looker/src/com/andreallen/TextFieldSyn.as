package com.andreallen
{
	import libs.txtSyn;
	
	public class TextFieldSyn extends txtSyn
	{
		private var _synXml:XML
		private var _vo:ApiVO
		private var _voArr:Array
//RECIEVES THE XML DATA		
		public function TextFieldSyn(sX:XML)
		{
			super();
		
			_synXml=sX
			_voArr=[]
//PUTS THE DATA INTO VO'S 				
			for(var i:int=0;i<_synXml.result.length();i++)
			{
				_vo= new ApiVO
				_vo.term=_synXml.result[i].term.text();
				_vo.def=_synXml.result[i].definition.text();
				_vo.exam=_synXml.result[i].example.text();
				_vo.speech=_synXml.result[i].partofspeech.text();	
				_voArr.push(_vo);
				
			}
 			passer();	
			check();
		}
//PUTS THE VO'S INTO TEXTFIELDS					
		private function passer():void
		{
			this.tfSTerm.text=_vo.term;
			this.tfSpeech.text=_vo.speech;
			this.tfExa.text=_vo.exam;
			this.tfDef.text=_vo.def;
		}
		private function check():void
		{
//TO RESET THE TEXTFIELDS AND IF THERES NO TEXTFIELDS
			if(this.tfSTerm.text=="A-Z"|| this.tfSTerm.text=="a-z")
			{
			this.tfSTerm.text="";
			}
			if(this.tfExa.text=="")
			{
				this.tfExa.text="None";
			}
		}
	}
}