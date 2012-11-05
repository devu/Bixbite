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

package org.bixbite.framework 
{
	import org.bixbite.core.Compound;
	import org.bixbite.framework.behaviour.*;
	import org.bixbite.framework.data.DisplayListData;
	import org.bixbite.framework.signal.DisplaySignal;
	import org.bixbite.framework.transponder.DisplayListTransponder;
	
	/**
	 * @langversion	3.0
	 */
	public class DisplayListManager extends Compound 
	{
		static public const GET_DISPLAY_LIST:String	= "DisplayListManager.GET_DSP_LIST";
		
		override public function init():void 
		{
			register(DisplayListData);
			
			addBehaviour(DisplaySignal.SET_CONTEXT		, DisplayListSetContext);
			addBehaviour(DisplaySignal.ADD_CONTEXT		, DisplayListAddContext);
			addBehaviour(DisplaySignal.REMOVE_CONTEXT	, DisplayListRemoveContext);
			
			register(DisplayListTransponder);
		}
		
		override public function destroy():void 
		{
			removeBehaviour(DisplaySignal.ADD_CONTEXT);
			removeBehaviour(DisplaySignal.SET_CONTEXT);
			removeBehaviour(DisplaySignal.REMOVE_CONTEXT);
			
			unregister(DisplayListData);
			unregister(DisplayListTransponder);
			
			super.destroy();
		}
		
	}

}