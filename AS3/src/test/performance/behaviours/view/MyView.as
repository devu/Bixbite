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

package test.performance.behaviours.view 
{
	import flash.display.Sprite;
	import org.bixbite.core.interfaces.ISignal;
	import org.bixbite.framework.view.DisplayView;
	import test.performance.behaviours.Signals;
	
	/**
	 * @version  compatibility - 0.5.0
	 * @since 0.5.0
	 */
	public class MyView extends DisplayView 
	{
		
		public function MyView() 
		{
			
		}
		
		override public function init():void 
		{
			setContext("myView");
			
			addSlot(Signals.REPOSITION		, onReposition);
			addSlot(Signals.CHANGE_COLOR	, onChangeColor);
		}
		
		private function onReposition(s:ISignal):void 
		{
			context.x = Math.random() * 600;
			context.y = Math.random() * 600;
		}
		
		private function onChangeColor(s:ISignal):void 
		{
			draw(s.params[0]);
		}
		
		private function draw(color:uint):void 
		{
			graphics.clear();
			graphics.beginFill(color, 1);
			graphics.drawRect(0, 0, 100, 100);
		}
		
	}

}