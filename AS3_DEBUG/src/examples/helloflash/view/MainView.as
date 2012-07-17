/**The MIT License

@copy (c) 2012 Devu Design Limited, Daniel Wasilewski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package examples.helloflash.view 
{
	import examples.helloflash.HelloFlash;
	import flash.display.Sprite;
	import flash.text.TextField;
	import org.bixbite.core.interfaces.ISignal;
	import org.bixbite.framework.view.DisplayViewContainer;
	
	/**
	 * @version  compatibility - 0.5.4
	 */
	public class MainView extends DisplayViewContainer 
	{
		private var textField:TextField;
		
		public function MainView() 
		{
			
		}
		
		override public function init():void 
		{
			super.init();
			
			var container:Sprite = new Sprite();
			
			textField = new TextField();
			textField.selectable = false;
			textField.text = "Click count: 1";
			container.addChild(textField);
			
			setContext("main", container);
			
			addSlot(HelloFlash.CREATE_BALL, onCreateBall);
			addSlot(HelloFlash.INIT, createBall);
			addSlot(HelloFlash.DIRECT_RESPONSE, onDirectResponse);
		}
		
		private function onDirectResponse(s:ISignal):void 
		{
			trace("Transponder fast response to parent of ball");
		}
		
		private function onCreateBall(s:ISignal):void
		{
			textField.text = "Click count:" + s.params[0];
			createBall(s);
		}
		
		private function createBall(s:ISignal):void 
		{
			var ball:Ball = new Ball();
			ball.x = Math.random() * 500;
			ball.y = Math.random() * 375;
			addView(ball);
		}
		
	}

}