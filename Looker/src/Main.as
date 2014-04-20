package
{
	import com.andreallen.WordApi;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main()
		{
//PLACES THE WORDAPI ON THE STAGE			
			createApi();
		}
		private function createApi():void
		{
			var wApi:WordApi = new WordApi();
			this.stage.nativeWindow.height=500;
			addChild(wApi);	
		}
	}
}