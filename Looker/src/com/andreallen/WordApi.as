package com.andreallen
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import libs.wholeClip;
	
	import mx.controls.Text;
	
	public class WordApi extends wholeClip
	{
		private var _xmlData:XML
		private var _vo:ApiVO
		private var _word:String
		private var _txtAb:TextFieldAb
		private var _txtSyn:TextFieldSyn 
		private var _switch:Boolean=true
		public function WordApi()    
		{
			super();
			this.iconAni.stop();
			this.closeBtn.stop();
			this.miniBtn.stop();
			this.stop();
			this.addEventListener(KeyboardEvent.KEY_DOWN,keypress);
			this.gBox.stop();
			this.SynT.buttonMode=true;
			this.micBtn.buttonMode=true;	
			this.addEventListener(MouseEvent.MOUSE_DOWN,onDown);
			this.closeBtn.addEventListener(MouseEvent.CLICK,onClose);
			this.closeBtn.addEventListener(MouseEvent.MOUSE_OVER,onCOver);
			this.miniBtn.addEventListener(MouseEvent.CLICK,onMini);
			this.closeBtn.addEventListener(MouseEvent.MOUSE_OUT,onMiOut);	
			this.miniBtn.addEventListener(MouseEvent.MOUSE_OUT,onClOut);
			this.tfField.addEventListener(MouseEvent.CLICK,onEraseAb);
			this.miniBtn.addEventListener(MouseEvent.MOUSE_OVER,onMiOver);
			this.SynT.addEventListener(MouseEvent.CLICK,selSyn);
			this.AbbT.addEventListener(MouseEvent.CLICK,selAbb);	
			this.micBtn.addEventListener(MouseEvent.CLICK,onS);

		}
//THE SEARCH FUNCTIONS FOR THE BUTTON AND KEY PRESS		
		private function onS(evt:MouseEvent):void
		{
			finder();
			refresh();
		}
		private function keypress(evt:KeyboardEvent):void
		{
			if(evt.keyCode==13)
			{
			finder();
			refresh();
			}
		}
//REMOVES THE OLD TEXTFIELD		
		private function refresh():void
		{
			if(!_switch && this.yBox.currentFrameLabel=="open")
			{
				removeChild(_txtSyn);
			}
			if(_switch && this.gBox.currentFrameLabel=="open")
			{
				removeChild(_txtAb);
			}
		}
//DEPENDING ON THE TAB SELECTED PRELOADS TH EPREDIFIND URLLOADER		
		private function finder():void
		{
			if(_switch)
			{
				var ld:URLLoader = new URLLoader();
				ld.load( new URLRequest("http://www.abbreviations.com/services/v1/abbr.aspx?tokenid=tk1488&term="+tfField.text));
				ld.addEventListener(Event.COMPLETE,onComp);
			}	
			this.iconAni.play();
			if(!_switch)
			{
				var ld2:URLLoader = new URLLoader();
				ld2.load( new URLRequest("http://www.abbreviations.com/services/v1/syno.aspx?tokenid=tk1488&word="+tfFieldS.text));
				ld2.addEventListener(Event.COMPLETE,onComp);
			}
		}
//SENDS THE XML TO THE CORRECT SECTION AND PLACE IT ON THE STAGE		
		private function onComp(evt:Event):void
		{
			_xmlData= new XML(evt.currentTarget.data);
			this.iconAni.stop();
			if(_switch)
			{
				this.gBox.gotoAndStop("open");
				 _txtAb = new TextFieldAb(_xmlData);
				_txtAb.x=100;
				_txtAb.y=100;	
				addChild(_txtAb);
			}	
			if(!_switch)
			{	
				this.yBox.gotoAndStop("open");
				_txtSyn= new TextFieldSyn(_xmlData);
				_txtSyn.x=100;
				_txtSyn.y=100;
				addChild(_txtSyn);
			}		
		} 
//RESETS INPUT TEXTFIELDS		
		private function onEraseAb(evt:MouseEvent):void
		{
			if(tfField.text=="Enter your word.")
			{
				tfField.text="";
			}
		}
		private function onEraseSy(evt:MouseEvent):void
		{
			if(tfFieldS.text=="Enter your word.")
			{
				tfFieldS.text="";	
			}
		}
//LISTENS FOR THE CLICKED TAB AND PREFORMS THE DEFINED ACTIONS		
		private function selAbb(evt:MouseEvent):void
		{
			this.gotoAndStop(1);
			this.gBox.stop();
			this.SynT.buttonMode=true;
			this.tfField.addEventListener(MouseEvent.CLICK,onEraseAb);
			_switch=true;
			if(_txtSyn)
			{
			removeChild(_txtSyn);
			}
		}
		private function selSyn(evt:MouseEvent):void
		{
			this.gotoAndStop(2);
			this.AbbT2.addEventListener(MouseEvent.CLICK,selAbb);
			this.tfFieldS.addEventListener(MouseEvent.CLICK,onEraseSy);	
			this.yBox.stop();
			if(_txtAb)
			{
				removeChild(_txtAb);
			}
			_switch=false
			this.AbbT2.buttonMode=true;
			this.SynT.buttonMode=false;

		}
//MAIN MOUSE FUNCTIONS			
		private function onCOver(evt:MouseEvent):void
		{
			evt.currentTarget.gotoAndStop(2);
		}
		private function onMiOver(evt:MouseEvent):void
		{
			evt.currentTarget.gotoAndStop(2);
		}
		private function onClOut(evt:MouseEvent):void
		{
			evt.currentTarget.gotoAndStop(1);
		}
		private function onMiOut(evt:MouseEvent):void
		{
			evt.currentTarget.gotoAndStop(1);
		}
		private function onDown(evt:MouseEvent):void
		{
			this.stage.nativeWindow.startMove();
		}
		private function onClose(evt:MouseEvent):void
		{
			this.stage.nativeWindow.close();
		}
		private function onMini(evt:MouseEvent):void
		{
			this.stage.nativeWindow.minimize();
		}
	}
}