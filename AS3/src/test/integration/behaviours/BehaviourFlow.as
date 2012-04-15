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

package test.integration.behaviours 
{
	import org.bixbite.core.Compound;
	import test.integration.behaviours.behaviour.Redraw;
	import test.integration.behaviours.behaviour.Startup;
	import test.integration.behaviours.data.MyData;
	import test.integration.behaviours.transponder.MyTransponder;
	import test.integration.behaviours.view.MyView;
	
	/**
	 * @version  compatibility - 0.5.1
	 * @since 0.5.0
	 * 
	 * footprint 6.32kb
	 */
	public class BehaviourFlow extends Compound 
	{
		
		public function BehaviourFlow() 
		{
			var m:MyData 		= new MyData();
			var t:MyTransponder = new MyTransponder();
			var v:MyView;
			
			for (var i:int = 0; i < 10; i++) {
				v = new MyView();
				stageView.addView(v);
			}
			
			addBehaviour(Signals.STARTUP	, Startup		, true);
			addBehaviour(Signals.REDRAW		, Redraw);
			
			startup(Signals.STARTUP);
		}
		
	}

}